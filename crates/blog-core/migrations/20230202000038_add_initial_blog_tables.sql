-- Add migration script here

CREATE TABLE
    users (
        id BINARY(16) PRIMARY KEY,
        created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        username TEXT NOT NULL,
        password TEXT NOT NULL
    );

CREATE TABLE
    blogs (
        id BINARY(16) PRIMARY KEY,
        created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        title TEXT NOT NULL,
        content TEXT NOT NULL,
        author_id BINARY(16) NOT NULL,
        slug TEXT NOT NULL,
        KEY author_id_idx (author_id)
    );

CREATE TABLE
    comments (
        id BINARY(16) PRIMARY KEY,
        created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        title TEXT NOT NULL,
        content TEXT NOT NULL,
        author_id BINARY(16) NOT NULL,
        blog_id BINARY(16) NOT NULL,
        KEY author_id_idx (author_id),
        KEY blog_id_idx (blog_id)
    );