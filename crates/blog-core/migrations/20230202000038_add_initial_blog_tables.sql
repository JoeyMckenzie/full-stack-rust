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
        KEY blog_author_idx (id, author_id)
    );

CREATE TABLE
    comments (
        id BINARY(16) PRIMARY KEY,
        created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        title TEXT NOT NULL,
        content TEXT NOT NULL,
        author_id BINARY(16) NOT NULL,
        blog_id BINARY(16) NOT NULL,
        KEY comment_author_blog_idx (id, author_id, blog_id)
    );