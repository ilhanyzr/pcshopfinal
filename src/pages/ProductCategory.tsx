import React, { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { 
  Star, 
  Filter, 
  X, 
  Search,
  Package,
  ChevronRight,
  ChevronDown,
  ShoppingCart
} from 'lucide-react';
import { supabase } from '../lib/supabase';
import { useCartStore } from '../store/cartStore';

interface Product {
  id: string;
  name: string;
  price: number;
  description: string;
  image: string | string[];
  specs: string[];
  rating: number;
  stock: number;
  category: string;
  brand: string;
  technical_specs?: {
    cpu?: {
      model?: string;
      series?: string;
      family?: string;
      manufacturer?: string;
      cores?: number;
      threads?: number;
      base_clock?: string;
      boost_clock?: string;
      cache?: string;
      socket?: string;
      tdp?: string;
    };
    gpu?: {
      model?: string;
      vram?: string;
      type?: string;
      memory_bus?: string;
      cuda_cores?: number;
    };
    display?: {
      size?: string;
      resolution?: string;
      refresh_rate?: number;
      panel?: string;
    };
    ram?: {
      size?: string;
      type?: string;
      speed?: string;
    };
  };
}

const ProductCategory = () => {
  const { categoryId } = useParams();
  const addItem = useCartStore((state) => state.addItem);
  const navigate = useNavigate();
  const [products, setProducts] = useState<Product[]>([]);
  const [loading, setLoading] = useState(true);
  const [sortBy, setSortBy] = useState('featured');
  const [searchTerm, setSearchTerm] = useState('');
  const [selectedBrands, setSelectedBrands] = useState<string[]>([]);
  const [priceRange, setPriceRange] = useState({ min: '', max: '' });
  const [brands, setBrands] = useState<string[]>([]);

  // CPU specific filters
  const [cpuFilters, setCpuFilters] = useState({
    manufacturer: [] as string[],
    series: [] as string[],
    family: [] as string[],
    cores: [] as string[],
    socket: [] as string[],
    frequency: [] as string[],
    tdp: [] as string[]
  });

  // GPU specific filters
  const [gpuFilters, setGpuFilters] = useState({
    manufacturer: [] as string[],
    memory: [] as string[],
    memoryType: [] as string[],
    memoryBus: [] as string[],
    rayTracing: false
  });

  // Laptop specific filters
  const [laptopFilters, setLaptopFilters] = useState({
    screenSize: [] as string[],
    resolution: [] as string[],
    refreshRate: [] as string[],
    cpuBrand: [] as string[],
    gpuBrand: [] as string[],
    ramSize: [] as string[],
    storageType: [] as string[]
  });

  // Gaming PC specific filters
  const [gamingPcFilters, setGamingPcFilters] = useState({
    brand: [] as string[],
    gpuModel: [] as string[],
    cpuModel: [] as string[],
    gpuSeries: [] as string[],
    ramType: [] as string[]
  });

  // Filter options for each category
  const filterOptions = {
    cpu: {
      manufacturer: ['Intel', 'AMD'],
      series: [
        'Intel Core 14th Gen',
        'Intel Core 13th Gen', 
        'Intel Core 12th Gen',
        'AMD Ryzen 7000',
        'AMD Ryzen 5000'
      ],
      family: [
        'Core i9',
        'Core i7',
        'Core i5',
        'Ryzen 9',
        'Ryzen 7',
        'Ryzen 5'
      ],
      cores: [
        '4 Core',
        '6 Core',
        '8 Core',
        '12 Core',
        '16 Core',
        '24 Core',
        '32 Core'
      ],
      socket: [
        'LGA 1700',
        'LGA 1200',
        'AM5',
        'AM4'
      ],
      frequency: [
        '3.0 GHz - 3.9 GHz',
        '4.0 GHz - 4.9 GHz',
        '5.0 GHz - 5.9 GHz',
        '6.0 GHz ve üzeri'
      ],
      tdp: [
        '35W - 65W',
        '66W - 95W',
        '96W - 125W',
        '126W ve üzeri'
      ]
    },
    gpu: {
      manufacturer: ['NVIDIA', 'AMD'],
      memory: ['4GB', '6GB', '8GB', '12GB', '16GB', '24GB'],
      memoryType: ['GDDR6', 'GDDR6X', 'GDDR7'],
      memoryBus: ['128-bit', '192-bit', '256-bit', '384-bit']
    },
    laptop: {
      screenSize: ['13.3"', '14"', '15.6"', '16"', '17.3"'],
      resolution: ['1920x1080', '2560x1440', '3840x2160'],
      refreshRate: ['60Hz', '144Hz', '165Hz', '240Hz', '360Hz'],
      cpuBrand: ['Intel', 'AMD'],
      gpuBrand: ['NVIDIA', 'AMD', 'Intel'],
      ramSize: ['8GB', '16GB', '32GB', '64GB'],
      storageType: ['SSD', 'NVMe SSD', 'HDD']
    },
    gamingPc: {
      brand: [
        'MSI',
        'ASUS ROG',
        'Corsair',
        'NZXT',
        'HP'
      ],
      gpuModel: [
        'GeForce RTX 4090',
        'GeForce RTX 4080',
        'GeForce RTX 4070 Ti',
        'GeForce RTX 4070',
        'GeForce RTX 4060 Ti'
      ],
      cpuModel: [
        'Intel Core i9-13900KS',
        'Intel Core i7-13700K',
        'Intel Core i5-13600K',
        'AMD Ryzen 9 7950X3D',
        'AMD Ryzen 7 7800X3D'
      ],
      gpuSeries: [
        'NVIDIA GeForce RTX 40',
        'NVIDIA GeForce RTX 30',
        'AMD Radeon RX 7000',
        'AMD Radeon RX 6000'
      ],
      ramType: [
        'DDR5',
        'DDR4'
      ]
    }
  };

  useEffect(() => {
    loadProducts();
  }, [categoryId, selectedBrands, priceRange, cpuFilters, gpuFilters, laptopFilters, gamingPcFilters]);

  const loadProducts = async () => {
    try {
      setLoading(true);
      let query = supabase
        .from('products')
        .select('*')
        .eq('category', categoryId);

      if (selectedBrands.length > 0) {
        query = query.in('brand', selectedBrands);
      }

      if (priceRange.min) {
        query = query.gte('price', parseFloat(priceRange.min));
      }

      if (priceRange.max) {
        query = query.lte('price', parseFloat(priceRange.max));
      }

      const { data, error } = await query;
      
      if (error) throw error;

      let filteredData = data || [];

      // Apply category-specific filters
      switch (categoryId) {
        case 'cpu':
          filteredData = applyCpuFilters(filteredData);
          break;
        case 'gpu':
          filteredData = applyGpuFilters(filteredData);
          break;
        case 'gaming-laptop':
        case 'ultrabook':
          filteredData = applyLaptopFilters(filteredData);
          break;
        case 'gaming-pc':
          filteredData = applyGamingPcFilters(filteredData);
          break;
      }

      // Apply search filter
      if (searchTerm) {
        filteredData = filteredData.filter(product =>
          product.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
          product.description.toLowerCase().includes(searchTerm.toLowerCase())
        );
      }

      // Sort products
      filteredData = sortProducts(filteredData, sortBy);

      setProducts(filteredData);

      // Get unique brands
      const uniqueBrands = [...new Set(filteredData.map(p => p.brand))].filter(Boolean);
      setBrands(uniqueBrands);
    } catch (error) {
      console.error('Error loading products:', error);
    } finally {
      setLoading(false);
    }
  };

  const applyCpuFilters = (products: Product[]) => {
    return products.filter(product => {
      const cpuSpecs = product.technical_specs?.cpu;
      if (!cpuSpecs) return true;

      // Apply each CPU filter
      if (cpuFilters.manufacturer.length > 0 && !cpuFilters.manufacturer.includes(cpuSpecs.manufacturer || '')) {
        return false;
      }

      if (cpuFilters.series.length > 0 && !cpuFilters.series.includes(cpuSpecs.series || '')) {
        return false;
      }

      if (cpuFilters.family.length > 0 && !cpuFilters.family.includes(cpuSpecs.family || '')) {
        return false;
      }

      if (cpuFilters.cores.length > 0) {
        const coreCount = `${cpuSpecs.cores} Core`;
        if (!cpuFilters.cores.includes(coreCount)) {
          return false;
        }
      }

      if (cpuFilters.socket.length > 0 && !cpuFilters.socket.includes(cpuSpecs.socket || '')) {
        return false;
      }

      if (cpuFilters.frequency.length > 0) {
        const boostFreq = parseFloat(cpuSpecs.boost_clock?.replace('GHz', '') || '0');
        const matchesFreq = cpuFilters.frequency.some(range => {
          const [min, max] = range.split(' - ').map(f => parseFloat(f));
          if (range.includes('ve üzeri')) {
            return boostFreq >= parseFloat(range.split(' ')[0]);
          }
          return boostFreq >= min && boostFreq <= max;
        });
        if (!matchesFreq) return false;
      }

      if (cpuFilters.tdp.length > 0) {
        const tdpValue = parseInt(cpuSpecs.tdp?.replace('W', '') || '0');
        const matchesTdp = cpuFilters.tdp.some(range => {
          if (range.includes('ve üzeri')) {
            return tdpValue >= parseInt(range.split(' ')[0]);
          }
          const [min, max] = range.split(' - ').map(w => parseInt(w));
          return tdpValue >= min && tdpValue <= max;
        });
        if (!matchesTdp) return false;
      }

      return true;
    });
  };

  const applyGpuFilters = (products: Product[]) => {
    return products.filter(product => {
      const gpuSpecs = product.technical_specs?.gpu;
      if (!gpuSpecs) return true;

      if (gpuFilters.manufacturer.length > 0) {
        const manufacturer = gpuSpecs.model?.split(' ')[0];
        if (!gpuFilters.manufacturer.includes(manufacturer || '')) {
          return false;
        }
      }

      if (gpuFilters.memory.length > 0 && !gpuFilters.memory.includes(gpuSpecs.vram || '')) {
        return false;
      }

      if (gpuFilters.memoryType.length > 0 && !gpuFilters.memoryType.includes(gpuSpecs.type || '')) {
        return false;
      }

      if (gpuFilters.memoryBus.length > 0 && !gpuFilters.memoryBus.includes(gpuSpecs.memory_bus || '')) {
        return false;
      }

      return true;
    });
  };

  const applyLaptopFilters = (products: Product[]) => {
    return products.filter(product => {
      const specs = product.technical_specs;
      if (!specs) return true;

      if (laptopFilters.screenSize.length > 0 && !laptopFilters.screenSize.includes(specs.display?.size || '')) {
        return false;
      }

      if (laptopFilters.resolution.length > 0 && !laptopFilters.resolution.includes(specs.display?.resolution || '')) {
        return false;
      }

      if (laptopFilters.refreshRate.length > 0) {
        const rate = `${specs.display?.refresh_rate}Hz`;
        if (!laptopFilters.refreshRate.includes(rate)) {
          return false;
        }
      }

      if (laptopFilters.ramSize.length > 0 && !laptopFilters.ramSize.includes(specs.ram?.size || '')) {
        return false;
      }

      return true;
    });
  };

  const applyGamingPcFilters = (products: Product[]) => {
    return products.filter(product => {
      const specs = product.technical_specs;
      if (!specs) return true;

      if (gamingPcFilters.brand.length > 0 && !gamingPcFilters.brand.includes(product.brand)) {
        return false;
      }

      if (gamingPcFilters.gpuModel.length > 0 && !gamingPcFilters.gpuModel.includes(specs.gpu?.model || '')) {
        return false;
      }

      if (gamingPcFilters.cpuModel.length > 0 && !gamingPcFilters.cpuModel.includes(specs.cpu?.model || '')) {
        return false;
      }

      if (gamingPcFilters.gpuSeries.length > 0) {
        const gpuModel = specs.gpu?.model || '';
        const matchesSeries = gamingPcFilters.gpuSeries.some(series => 
          gpuModel.startsWith(series)
        );
        if (!matchesSeries) return false;
      }

      if (gamingPcFilters.ramType.length > 0 && !gamingPcFilters.ramType.includes(specs.ram?.type || '')) {
        return false;
      }

      return true;
    });
  };

  const sortProducts = (products: Product[], sortBy: string) => {
    const sorted = [...products];
    switch (sortBy) {
      case 'price-asc':
        sorted.sort((a, b) => a.price - b.price);
        break;
      case 'price-desc':
        sorted.sort((a, b) => b.price - a.price);
        break;
      case 'rating':
        sorted.sort((a, b) => b.rating - a.rating);
        break;
      default:
        // Featured sorting - you can implement custom logic here
        break;
    }
    return sorted;
  };

  const handleFilterChange = (category: string, value: string, filterType: 'cpu' | 'gpu' | 'laptop' | 'gaming-pc') => {
    switch (filterType) {
      case 'cpu':
        setCpuFilters(prev => ({
          ...prev,
          [category]: prev[category].includes(value)
            ? prev[category].filter(item => item !== value)
            : [...prev[category], value]
        }));
        break;
      case 'gpu':
        setGpuFilters(prev => ({
          ...prev,
          [category]: prev[category].includes(value)
            ? prev[category].filter(item => item !== value)
            : [...prev[category], value]
        }));
        break;
      case 'laptop':
        setLaptopFilters(prev => ({
          ...prev,
          [category]: prev[category].includes(value)
            ? prev[category].filter(item => item !== value)
            : [...prev[category], value]
        }));
        break;
      case 'gaming-pc':
        setGamingPcFilters(prev => ({
          ...prev,
          [category]: prev[category].includes(value)
            ? prev[category].filter(item => item !== value)
            : [...prev[category], value]
        }));
        break;
    }
  };

  const clearFilters = () => {
    setSelectedBrands([]);
    setPriceRange({ min: '', max: '' });
    setSearchTerm('');
    setCpuFilters({
      manufacturer: [],
      series: [],
      family: [],
      cores: [],
      socket: [],
      frequency: [],
      tdp: []
    });
    setGpuFilters({
      manufacturer: [],
      memory: [],
      memoryType: [],
      memoryBus: [],
      rayTracing: false
    });
    setLaptopFilters({
      screenSize: [],
      resolution: [],
      refreshRate: [],
      cpuBrand: [],
      gpuBrand: [],
      ramSize: [],
      storageType: []
    });
    setGamingPcFilters({
      brand: [],
      gpuModel: [],
      cpuModel: [],
      gpuSeries: [],
      ramType: []
    });
  };

  const FilterSection = ({ title, items, selectedItems, onChange, filterType }: {
    title: string;
    items: string[];
    selectedItems: string[];
    onChange: (value: string) => void;
    filterType: 'cpu' | 'gpu' | 'laptop' | 'gaming-pc';
  }) => (
    <div className="mb-6">
      <div className="flex items-center justify-between mb-3">
        <h4 className="font-medium">{title}</h4>
        <ChevronDown className="w-4 h-4 text-gray-500" />
      </div>
      <div className="space-y-2">
        {items.map(item => (
          <label key={item} className="flex items-center gap-2">
            <input
              type="checkbox"
              checked={selectedItems.includes(item)}
              onChange={() => onChange(item)}
              className="rounded border-gray-300 text-blue-600 focus:ring-blue-500"
            />
            <span className="text-sm">{item}</span>
          </label>
        ))}
      </div>
    </div>
  );

  return (
    <div className="max-w-7xl mx-auto px-4 py-8">
      <div className="flex flex-col md:flex-row gap-8">
        {/* Filters Sidebar */}
        <div className="w-full md:w-64 flex-shrink-0">
          <div className="bg-white rounded-lg shadow-sm p-6 sticky top-4">
            <div className="flex items-center justify-between mb-6">
              <h3 className="text-lg font-semibold">Filtreler</h3>
              {(selectedBrands.length > 0 || priceRange.min || priceRange.max || 
                Object.values(cpuFilters).some(arr => arr.length > 0) ||
                Object.values(gpuFilters).some(arr => Array.isArray(arr) ? arr.length > 0 : arr) ||
                Object.values(laptopFilters).some(arr => arr.length > 0) ||
                Object.values(gamingPcFilters).some(arr => arr.length > 0)) && (
                <button
                  onClick={clearFilters}
                  className="text-sm text-blue-600 hover:text-blue-700"
                >
                  Temizle
                </button>
              )}
            </div>

            {/* Category-specific filters */}
            {categoryId === 'cpu' && (
              <>
                <FilterSection
                  title="Üretici"
                  items={filterOptions.cpu.manufacturer}
                  selectedItems={cpuFilters.manufacturer}
                  onChange={(value) => handleFilterChange('manufacturer', value, 'cpu')}
                  filterType="cpu"
                />

                <FilterSection
                  title="Seri"
                  items={filterOptions.cpu.series}
                  selectedItems={cpuFilters.series}
                  onChange={(value) => handleFilterChange('series', value, 'cpu')}
                  filterType="cpu"
                />

                <FilterSection
                  title="Aile"
                  items={filterOptions.cpu.family}
                  selectedItems={cpuFilters.family}
                  onChange={(value) => handleFilterChange('family', value, 'cpu')}
                  filterType="cpu"
                />

                <FilterSection
                  title="Çekirdek Sayısı"
                  items={filterOptions.cpu.cores}
                  selectedItems={cpuFilters.cores}
                  onChange={(value) => handleFilterChange('cores', value, 'cpu')}
                  filterType="cpu"
                />

                <FilterSection
                  title="Soket"
                  items={filterOptions.cpu.socket}
                  selectedItems={cpuFilters.socket}
                  onChange={(value) => handleFilterChange('socket', value, 'cpu')}
                  filterType="cpu"
                />

                <FilterSection
                  title="Frekans"
                  items={filterOptions.cpu.frequency}
                  selectedItems={cpuFilters.frequency}
                  onChange={(value) => handleFilterChange('frequency', value, 'cpu')}
                  filterType="cpu"
                />

                <FilterSection
                  title="TDP"
                  items={filterOptions.cpu.tdp}
                  selectedItems={cpuFilters.tdp}
                  onChange={(value) => handleFilterChange('tdp', value, 'cpu')}
                  filterType="cpu"
                />
              </>
            )}

            {categoryId === 'gpu' && (
              <>
                <FilterSection
                  title="Üretici"
                  items={filterOptions.gpu.manufacturer}
                  selectedItems={gpuFilters.manufacturer}
                  onChange={(value) => handleFilterChange('manufacturer', value, 'gpu')}
                  filterType="gpu"
                />

                <FilterSection
                  title="Bellek"
                  items={filterOptions.gpu.memory}
                  selectedItems={gpuFilters.memory}
                  onChange={(value) => handleFilterChange('memory', value, 'gpu')}
                  filterType="gpu"
                />

                <FilterSection
                  title="Bellek Tipi"
                  items={filterOptions.gpu.memoryType}
                  selectedItems={gpuFilters.memoryType}
                  onChange={(value) => handleFilterChange('memoryType', value, 'gpu')}
                  filterType="gpu"
                />

                <FilterSection
                  title="Bellek Arayüzü"
                  items={filterOptions.gpu.memoryBus}
                  selectedItems={gpuFilters.memoryBus}
                  onChange={(value) => handleFilterChange('memoryBus', value, 'gpu')}
                  filterType="gpu"
                />
              </>
            )}

            {(categoryId === 'gaming-laptop' || categoryId === 'ultrabook') && (
              <>
                <FilterSection
                  title="Ekran Boyutu"
                  items={filterOptions.laptop.screenSize}
                  selectedItems={laptopFilters.screenSize}
                  onChange={(value) => handleFilterChange('screenSize', value, 'laptop')}
                  filterType="laptop"
                />

                <FilterSection
                  title="Çözünürlük"
                  items={filterOptions.laptop.resolution}
                  selectedItems={laptopFilters.resolution}
                  onChange={(value) => handleFilterChange('resolution', value, 'laptop')}
                  filterType="laptop"
                />

                <FilterSection
                  title="Yenileme Hızı"
                  items={filterOptions.laptop.refreshRate}
                  selectedItems={laptopFilters.refreshRate}
                  onChange={(value) => handleFilterChange('refreshRate', value, 'laptop')}
                  filterType="laptop"
                />

                <FilterSection
                  title="RAM"
                  items={filterOptions.laptop.ramSize}
                  selectedItems={laptopFilters.ramSize}
                  onChange={(value) => handleFilterChange('ramSize', value, 'laptop')}
                  filterType="laptop"
                />
              </>
            )}

            {categoryId === 'gaming-pc' && (
              <>
                <FilterSection
                  title="Marka"
                  items={filterOptions.gamingPc.brand}
                  selectedItems={gamingPcFilters.brand}
                  onChange={(value) => handleFilterChange('brand', value, 'gaming-pc')}
                  filterType="gaming-pc"
                />

                <FilterSection
                  title="Ekran Kartı"
                  items={filterOptions.gamingPc.gpuModel}
                  selectedItems={gamingPcFilters.gpuModel}
                  onChange={(value) => handleFilterChange('gpuModel', value, 'gaming-pc')}
                  filterType="gaming-pc"
                />

                <FilterSection
                  title="İşlemci"
                  items={filterOptions.gamingPc.cpuModel}
                  selectedItems={gamingPcFilters.cpuModel}
                  onChange={(value) => handleFilterChange('cpuModel', value, 'gaming-pc')}
                  filterType="gaming-pc"
                />

                <FilterSection
                  title="Ekran Kartı Serisi"
                  items={filterOptions.gamingPc.gpuSeries}
                  selectedItems={gamingPcFilters.gpuSeries}
                  onChange={(value) => handleFilterChange('gpuSeries', value, 'gaming-pc')}
                  filterType="gaming-pc"
                />

                <FilterSection
                  title="RAM Tipi"
                  items={filterOptions.gamingPc.ramType}
                  selectedItems={gamingPcFilters.ramType}
                  onChange={(value) => handleFilterChange('ramType', value, 'gaming-pc')}
                  filterType="gaming-pc"
                />
              </>
            )}

            {/* Brand Filter */}
            <div className="mb-6">
              <h4 className="font-medium mb-3">Markalar</h4>
              <div className="space-y-2">
                {brands.map(brand => (
                  <label key={brand} className="flex items-center gap-2">
                    <input
                      type="checkbox"
                      checked={selectedBrands.includes(brand)}
                      onChange={() => {
                        setSelectedBrands(prev => 
                          prev.includes(brand) 
                            ? prev.filter(b => b !== brand)
                            : [...prev, brand]
                        );
                      }}
                      className="rounded border-gray-300 text-blue-600 focus:ring-blue-500"
                    />
                    <span className="text-sm">{brand}</span>
                  </label>
                ))}
              </div>
            </div>

            {/* Price Range Filter */}
            <div className="mb-6">
              <h4 className="font-medium mb-3">Fiyat Aralığı</h4>
              <div className="flex gap-2">
                <input
                  type="number"
                  placeholder="Min"
                  value={priceRange.min}
                  onChange={(e) => setPriceRange(prev => ({ ...prev, min: e.target.value }))}
                  className="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                />
                <input
                  type="number"
                  placeholder="Max"
                  value={priceRange.max}
                  onChange={(e) => setPriceRange(prev => ({ ...prev, max: e.target.value }))}
                  className="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                />
              </div>
            </div>

            {/* Sort Options */}
            <div>
              <h4 className="font-medium mb-3">Sıralama</h4>
              <select
                value={sortBy}
                onChange={(e) => setSortBy(e.target.value)}
                className="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
              >
                <option value="featured">Öne Çıkanlar</option>
                <option value="price-asc">Fiyat (Düşükten Yükseğe)</option>
                <option value="price-desc">Fiyat (Yüksekten Düşüğe)</option>
                <option value="rating">En Çok Değerlendirilenler</option>
              </select>
            </div>
          </div>
        </div>

        {/* Products Grid */}
        <div className="flex-1">
          {/* Search and Results Count */}
          <div className="mb-6">
            <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
              <div className="relative flex-1 max-w-md">
                <input
                  type="text"
                  placeholder="Ürün ara..."
                  value={searchTerm}
                  onChange={(e) => setSearchTerm(e.target.value)}
                  className="w-full pl-10 pr-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                />
                <Search className="absolute left-3 top-2.5 text-gray-400 w-5 h-5" />
                {searchTerm && (
                  <button
                    onClick={() => setSearchTerm('')}
                    className="absolute right-3 top-2.5 text-gray-400 hover:text-gray-600"
                  >
                    <X className="w-5 h-5" />
                  </button>
                )}
              </div>
              <p className="text-gray-600">
                {products.length} ürün bulundu
              </p>
            </div>
          </div>

          {/* Products Grid */}
          {products.length > 0 ? (
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
              {products.map((product) => (
                <div 
                  key={product.id}
                  className="bg-white rounded-xl shadow-sm hover:shadow-lg transition-shadow duration-300 group"
                >
                  <div 
                    className="relative cursor-pointer"
                    onClick={() => navigate(`/product/${product.id}`)}
                  >
                    <img
                      src={Array.isArray(product.image) ? product.image[0] : product.image}
                      alt={product.name}
                      className="w-full h-48 object-cover rounded-t-xl group-hover:scale-105 transition-transform duration-300"
                    />
                    {product.stock === 0 ? (
                      <span className="absolute top-2 right-2 bg-red-500 text-white px-2 py-1 rounded-full text-sm">
                        Tükendi
                      </span>
                    ) : product.stock <= 10 ? (
                      <span className="absolute top-2 right-2 bg-orange-500 text-white px-2 py-1 rounded-full text-sm">
                        Son {product.stock} ürün
                      </span>
                    ) : null}
                  </div>
                  
                  <div className="p-4">
                    <div className="mb-2">
                      <h3 className="text-lg font-semibold text-gray-900 hover:text-blue-600 cursor-pointer truncate">
                        {product.name}
                      </h3>
                      <span className="text-sm text-gray-600">{product.brand}</span>
                    </div>
                    
                    <div className="flex items-center gap-1 mb-3">
                      {[...Array(5)].map((_, i) => (
                        <Star
                          key={i}
                          className={`w-4 h-4 ${
                            i < Math.floor(product.rating)
                              ? 'text-yellow-400 fill-current'
                              : 'text-gray-300'
                          }`}
                        />
                      ))}
                      <span className="text-sm text-gray-600 ml-1">{product.rating}</span>
                    </div>

                    <div className="flex items-center justify-between">
                      <span className="text-xl font-bold text-blue-600">
                        ₺{product.price.toLocaleString('tr-TR')}
                      </span>
                      <button
                        onClick={() => addItem(product)}
                        disabled={product.stock === 0}
                        className={`p-2 rounded-lg transition-colors ${
                          product.stock === 0
                            ? 'text-gray-400 cursor-not-allowed'
                            : 'text-blue-600 hover:bg-blue-50'
                        }`}
                        title={product.stock === 0 ? 'Ürün tükendi' : 'Sepete Ekle'}
                      >
                        <ShoppingCart className="w-5 h-5" />
                      </button>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          ) : (
            <div className="text-center py-12">
              <Package className="w-16 h-16 text-gray-400 mx-auto mb-4" />
              <h3 className="text-lg font-medium text-gray-900 mb-2">
                Ürün Bulunamadı
              </h3>
              <p className="text-gray-600">
                Arama kriterlerinize uygun ürün bulunamadı. Lütfen filtrelerinizi değiştirin.
              </p>
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default ProductCategory;