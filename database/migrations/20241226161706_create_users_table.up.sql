-- Table: users
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    oauth_provider VARCHAR(50) NOT NULL,
    oauth_uid VARCHAR(100) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    avatar_url TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON COLUMN users.id IS 'Primary key dari tabel users';
COMMENT ON COLUMN users.oauth_provider IS 'Penyedia OAuth (misalnya, Google)';
COMMENT ON COLUMN users.oauth_uid IS 'ID unik dari penyedia OAuth';
COMMENT ON COLUMN users.name IS 'Nama pengguna';
COMMENT ON COLUMN users.email IS 'Alamat email pengguna';
COMMENT ON COLUMN users.avatar_url IS 'URL avatar pengguna';
COMMENT ON COLUMN users.created_at IS 'Timestamp saat pengguna dibuat';