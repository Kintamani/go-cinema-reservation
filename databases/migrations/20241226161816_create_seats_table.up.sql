-- Table: seats
-- Enum type for payment status
DO $$ BEGIN
    CREATE TYPE SEAT_TYPES_ENUM AS ENUM ('Reguler', 'Gold', 'Satin', '4DX', 'Velvet', 'Sweetbox');
EXCEPTION
    WHEN duplicate_object THEN NULL;
END $$;

CREATE TABLE seats (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    auditorium_type_id UUID REFERENCES cinemas(id) ON DELETE CASCADE,
    seat_type SEAT_TYPES_ENUM NOT NULL,
    seat_price NUMERIC(10, 2) NOT NULL,
    seat_number VARCHAR(10) NOT NULL,
    seat_row VARCHAR(5) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX index_seats_on_cinema_id ON seats(auditorium_type_id);
COMMENT ON COLUMN seats.id IS 'Primary key dari tabel seats';
COMMENT ON COLUMN seats.auditorium_type_id IS 'Foreign key mengacu pada tabel auditorium_types';
COMMENT ON COLUMN seats.seat_type IS 'Jenis kursi';
COMMENT ON COLUMN seats.seat_price IS 'Harga kursi untuk tipe kursi';
COMMENT ON COLUMN seats.seat_number IS 'Identifier untuk kursi';
COMMENT ON COLUMN seats.seat_row IS 'Baris untuk kursi';
COMMENT ON COLUMN seats.created_at IS 'Timestamp saat kursi dibuat';