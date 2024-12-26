-- Table: film
CREATE TABLE movies (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(200) NOT NULL,
    description TEXT,
    duration_minutes INT NOT NULL,
    release_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON COLUMN movies.id IS 'Primary key dari tabel movies';
COMMENT ON COLUMN movies.title IS 'Judul film';
COMMENT ON COLUMN movies.description IS 'Deskripsi film';
COMMENT ON COLUMN movies.duration_minutes IS 'Durasi film dalam menit';
COMMENT ON COLUMN movies.release_date IS 'Tanggal rilis film';
COMMENT ON COLUMN movies.created_at IS 'Timestamp saat film dibuat';