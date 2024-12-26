-- Table: cities
CREATE TABLE cities (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON COLUMN cities.id IS 'Primary key dari tabel cities';
COMMENT ON COLUMN cities.name IS 'Nama kota';
COMMENT ON COLUMN cities.created_at IS 'Timestamp saat kota dibuat';