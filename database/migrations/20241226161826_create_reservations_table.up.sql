-- Table: reservations
CREATE TABLE reservations (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    seats_id UUID REFERENCES seats(id) ON DELETE CASCADE,
    reservation_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX index_reservations_on_user_id ON reservations(user_id);
CREATE INDEX index_reservations_on_seats_id ON reservations(seats_id);
COMMENT ON COLUMN reservations.id IS 'Primary key dari tabel reservations';
COMMENT ON COLUMN reservations.user_id IS 'Foreign key mengacu pada tabel users';
COMMENT ON COLUMN reservations.seats_id IS 'Foreign key mengacu pada tabel seat';
COMMENT ON COLUMN reservations.reservation_time IS 'Waktu saat reservasi dibuat';
COMMENT ON COLUMN reservations.created_at IS 'Timestamp saat reservasi dibuat';