-- Table: payments
-- Enum type for payment status
DO $$ BEGIN
    CREATE TYPE PAYMENT_STATUS_ENUM AS ENUM ('Pending', 'Processing', 'Completed', 'Failed', 'Refunded');
EXCEPTION
    WHEN duplicate_object THEN NULL;
END $$;

CREATE TABLE payments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    reservation_id UUID REFERENCES reservations(id) ON DELETE CASCADE UNIQUE,
    payment_gateway_id UUID REFERENCES payment_gateways(id) ON DELETE CASCADE,
    amount NUMERIC(10, 2) NOT NULL,
    payment_status PAYMENT_STATUS_ENUM NOT NULL,
    payment_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX index_payments_on_reservation_id ON payments(reservation_id);
CREATE INDEX index_payments_on_payment_gateway_id ON payments(payment_gateway_id);
COMMENT ON COLUMN payments.id IS 'Primary key dari tabel payments';
COMMENT ON COLUMN payments.reservation_id IS 'Foreign key mengacu pada tabel reservations';
COMMENT ON COLUMN payments.payment_gateway_id IS 'Foreign key mengacu pada tabel payment_gateways';
COMMENT ON COLUMN payments.amount IS 'Jumlah total yang dibayar untuk reservasi';
COMMENT ON COLUMN payments.payment_status IS 'Status pembayaran';
COMMENT ON COLUMN payments.payment_time IS 'Waktu saat pembayaran dilakukan';
COMMENT ON COLUMN payments.created_at IS 'Timestamp saat pembayaran dibuat';
