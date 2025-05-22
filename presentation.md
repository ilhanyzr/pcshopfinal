# PC Sales Website Project
## Modern E-Commerce Solution with React & Supabase

### 1. Project Overview

### Tech Stack
- Frontend: React + TypeScript + Vite
- Styling: Tailwind CSS
- Database: Supabase (PostgreSQL)
- Authentication: Supabase Auth
- State Management: Zustand
- Icons: Lucide React

![bg right:40% 80%](https://images.unsplash.com/photo-1633356122544-f134324a6cee?auto=format&fit=crop&q=80&w=1000)

---

## 2. Database Schema

### Core Tables
1. **Products**
   ```sql
   CREATE TABLE products (
     id uuid PRIMARY KEY,
     name text NOT NULL,
     price numeric NOT NULL,
     description text,
     image text,
     specs text[],
     rating numeric DEFAULT 0,
     stock integer DEFAULT 0,
     category text NOT NULL
   );
   ```

![bg right:40% 80%](https://images.unsplash.com/photo-1558494949-ef010cbdcc31?auto=format&fit=crop&q=80&w=1000)

---

## 3. Key Features

### Authentication System
- Email/Password Authentication
- Protected Routes
- User Profile Management

```typescript
const Login = () => {
  const handleLogin = async () => {
    const { data, error } = await supabase.auth.signInWithPassword({
      email,
      password
    });
  };
};
```

![bg right:40% 80%](https://images.unsplash.com/photo-1560157368-946d9c8f7cb6?auto=format&fit=crop&q=80&w=1000)

---

### Product Management

#### Admin Panel Features
- Add/Edit/Delete Products
- Stock Management
- Category Management
- Price Updates

```typescript
const handleAddProduct = async () => {
  const { data, error } = await supabase
    .from('products')
    .insert([newProduct])
    .select();
};
```

![bg right:40% 80%](https://images.unsplash.com/photo-1460925895917-afdab827c52f?auto=format&fit=crop&q=80&w=1000)

---

### Shopping Cart

#### Features
- Add/Remove Items
- Quantity Management
- Price Calculations
- State Persistence

```typescript
export const useCartStore = create<CartStore>((set) => ({
  items: [],
  addItem: (item) => set((state) => ({
    items: [...state.items, item]
  })),
  removeItem: (id) => set((state) => ({
    items: state.items.filter(item => item.id !== id)
  }))
}));
```

![bg right:40% 80%](https://images.unsplash.com/photo-1557821552-17105176677c?auto=format&fit=crop&q=80&w=1000)

---

## 4. Security Implementation

### Database Security
1. **Row Level Security**
   ```sql
   CREATE POLICY "Users can view own profile"
     ON profiles FOR SELECT
     USING (auth.uid() = id);
   ```

2. **Audit Logging**
   ```sql
   CREATE TABLE audit_logs (
     id uuid PRIMARY KEY,
     table_name text,
     operation text,
     record_id uuid,
     user_id uuid,
     old_data jsonb,
     new_data jsonb
   );
   ```

![bg right:40% 80%](https://images.unsplash.com/photo-1555949963-ff9fe0c870eb?auto=format&fit=crop&q=80&w=1000)

---

## 5. Frontend Architecture

### Component Structure
```
src/
├── components/
│   ├── Navbar.tsx
│   └── ProductCard.tsx
├── pages/
│   ├── Home.tsx
│   ├── Products.tsx
│   ├── Cart.tsx
│   ├── Profile.tsx
│   └── Admin.tsx
├── store/
│   └── cartStore.ts
└── lib/
    └── supabase.ts
```

![bg right:40% 80%](https://images.unsplash.com/photo-1507238691740-187a5b1d37b8?auto=format&fit=crop&q=80&w=1000)

---

## 6. Common Questions & Answers

### Q: How is user data protected?
- Row Level Security in database
- JWT authentication
- Secure password hashing
- Input validation

### Q: How does the cart system work?
- Client-side state management with Zustand
- Persistent storage
- Real-time updates
- Optimistic UI updates

![bg right:40% 80%](https://images.unsplash.com/photo-1571171637578-41bc2dd41cd2?auto=format&fit=crop&q=80&w=1000)