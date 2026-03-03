/*
  # Update Libri Table Schema - Remove Anno and Copie Fields

  1. Changes to `libri` table
    - Remove `anno` column (publication year)
    - Remove `copie` column (number of copies)
    - Keep only: id, titolo, autore, genere, created_at

  This streamlines the book catalog to track only essential information.
*/

ALTER TABLE libri DROP COLUMN IF EXISTS anno;
ALTER TABLE libri DROP COLUMN IF EXISTS copie;
