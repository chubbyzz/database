-- +goose Up
-- +goose NO TRANSACTION
CREATE DATABASE db_invest;

-- +goose Down
-- +goose NO TRANSACTION
DROP DATABASE db_invest;
