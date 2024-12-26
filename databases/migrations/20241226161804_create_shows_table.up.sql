-- Table: shows
CREATE TABLE shows (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    movie_id UUID REFERENCES movies(id) ON DELETE CASCADE,
    auditorium_type_id UUID REFERENCES auditorium_types(id) ON DELETE CASCADE,
    show_time TIMESTAMP NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX index_shows_on_movie_id ON shows(movie_id);
CREATE INDEX index_shows_on_auditorium_type_id ON shows(auditorium_type_id);
COMMENT ON COLUMN shows.id IS 'Primary key dari tabel shows';
COMMENT ON COLUMN shows.movie_id IS 'Foreign key mengacu pada tabel movies';
COMMENT ON COLUMN shows.auditorium_type_id IS 'Foreign key mengacu pada tabel auditorium_types';
COMMENT ON COLUMN shows.show_time IS 'Waktu yang dijadwalkan untuk pertunjukan';
COMMENT ON COLUMN shows.created_at IS 'Timestamp saat pertunjukan dibuat';