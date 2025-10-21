# API Documentation

## Base URL
```
http://your-domain.com/api
```

## Authentication

All API requests require authentication token in header:

```http
Authorization: Bearer YOUR_TOKEN
```

---

## Endpoints

### Products

#### List All Products
```http
GET /api/products
```

**Response:**
```json
{
  "success": true,
  "data": [
    {
      "id": 1,
      "name": "WP-18",
      "category": "TIG Torch",
      "price": 150.00,
      "stock": 50
    }
  ]
}
```

#### Get Product Details
```http
GET /api/products/{id}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "id": 1,
    "name": "WP-18",
    "description": "Water-cooled TIG torch",
    "specifications": {...},
    "price": 150.00,
    "stock": 50
  }
}
```

#### Create Product
```http
POST /api/products
```

**Request Body:**
```json
{
  "name": "WP-18",
  "category": "TIG Torch",
  "price": 150.00,
  "stock": 50
}
```

#### Update Product
```http
PUT /api/products/{id}
```

#### Delete Product
```http
DELETE /api/products/{id}
```

---

### Quotes

#### List All Quotes
```http
GET /api/quotes
```

#### Create Quote
```http
POST /api/quotes
```

**Request Body:**
```json
{
  "customer_name": "John Doe",
  "items": [
    {
      "product_id": 1,
      "quantity": 10
    }
  ]
}
```

#### Get Quote Details
```http
GET /api/quotes/{id}
```

---

### Inventory

#### Get Inventory Status
```http
GET /api/inventory
```

#### Update Stock Level
```http
PUT /api/inventory/{id}
```

**Request Body:**
```json
{
  "stock": 100
}
```

---

## Error Responses

### 400 Bad Request
```json
{
  "success": false,
  "error": "Invalid request parameters"
}
```

### 401 Unauthorized
```json
{
  "success": false,
  "error": "Authentication required"
}
```

### 404 Not Found
```json
{
  "success": false,
  "error": "Resource not found"
}
```

### 500 Internal Server Error
```json
{
  "success": false,
  "error": "Internal server error"
}
```

---

## Rate Limiting

- **Rate Limit:** 1000 requests per hour
- **Header:** `X-RateLimit-Remaining`

---

## Pagination

All list endpoints support pagination:

```http
GET /api/products?page=1&limit=20
```

**Response:**
```json
{
  "success": true,
  "data": [...],
  "pagination": {
    "current_page": 1,
    "total_pages": 5,
    "total_items": 100,
    "per_page": 20
  }
}
```

---

## Filtering & Sorting

### Filtering
```http
GET /api/products?category=TIG+Torch&min_price=100
```

### Sorting
```http
GET /api/products?sort=price&order=asc
```

---

## Webhooks

Configure webhooks to receive real-time notifications:

```json
{
  "event": "product.created",
  "data": {...}
}
```

**Supported Events:**
- `product.created`
- `product.updated`
- `product.deleted`
- `quote.created`
- `inventory.low_stock`

---

## SDKs

- **PHP SDK:** Coming soon
- **JavaScript SDK:** Coming soon
- **Python SDK:** Coming soon

---

## Support

- **Email:** api@taumaco.com
- **GitHub Issues:** [Report Issue](https://github.com/Grihfen/taumaco-product-system/issues)