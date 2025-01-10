-- Table: bioskop
CREATE TABLE cinemas (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    city_id UUID REFERENCES cities(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    address TEXT NOT NULL,
    longitude NUMERIC(9, 6) NOT NULL,
    latitude NUMERIC(9, 6) NOT NULL,
    image_url TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX index_cinemas_on_city_id ON cinemas(city_id);
COMMENT ON COLUMN cinemas.id IS 'Primary key dari tabel cinemas';
COMMENT ON COLUMN cinemas.city_id IS 'Foreign key mengacu pada tabel cities';
COMMENT ON COLUMN cinemas.name IS 'Nama bioskop';
COMMENT ON COLUMN cinemas.address IS 'Alamat bioskop';
COMMENT ON COLUMN cinemas.longitude IS 'Garis bujur lokasi bioskop';
COMMENT ON COLUMN cinemas.latitude IS 'Garis lintang lokasi bioskop';
COMMENT ON COLUMN cinemas.image_url IS 'URL gambar bioskop';
COMMENT ON COLUMN cinemas.created_at IS 'Timestamp saat bioskop dibuat';