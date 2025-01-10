-- Table: auditorium_types
CREATE TABLE auditorium_types (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    cinema_id UUID REFERENCES cinemas(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    displayed_name VARCHAR(100),
    background_main TEXT,
    background_color_code VARCHAR(7),
    logo_white TEXT,
    logo_color TEXT,
    title VARCHAR(100),
    description TEXT,
    alert TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX index_auditorium_types_on_cinema_id ON auditorium_types(cinema_id);
COMMENT ON COLUMN auditorium_types.id IS 'Primary key dari tabel auditorium_types';
COMMENT ON COLUMN auditorium_types.cinema_id IS 'Foreign key mengacu pada tabel cinemas';
COMMENT ON COLUMN auditorium_types.name IS 'Nama tipe auditorium';
COMMENT ON COLUMN auditorium_types.displayed_name IS 'Nama yang ditampilkan untuk tipe auditorium';
COMMENT ON COLUMN auditorium_types.background_main IS 'URL background utama untuk tipe auditorium';
COMMENT ON COLUMN auditorium_types.background_color_code IS 'Kode warna latar belakang auditorium';
COMMENT ON COLUMN auditorium_types.logo_white IS 'URL logo putih untuk tipe auditorium';
COMMENT ON COLUMN auditorium_types.logo_color IS 'URL logo berwarna untuk tipe auditorium';
COMMENT ON COLUMN auditorium_types.title IS 'Judul tipe auditorium';
COMMENT ON COLUMN auditorium_types.description IS 'Deskripsi tipe auditorium';
COMMENT ON COLUMN auditorium_types.alert IS 'Pesan peringatan terkait tipe auditorium';
COMMENT ON COLUMN auditorium_types.created_at IS 'Timestamp saat tipe auditorium dibuat';