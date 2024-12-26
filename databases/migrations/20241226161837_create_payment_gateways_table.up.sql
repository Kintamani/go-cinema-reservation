-- Table: payment_gateways
CREATE TABLE payment_gateways (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON COLUMN payment_gateways.id IS 'Primary key dari tabel payment_gateways';
COMMENT ON COLUMN payment_gateways.name IS 'Nama dari gateway pembayaran';
COMMENT ON COLUMN payment_gateways.description IS 'Informasi tambahan tentang gateway pembayaran';
COMMENT ON COLUMN payment_gateways.created_at IS 'Timestamp saat gateway pembayaran dibuat';
