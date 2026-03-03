/*
  # Create Biblioteca Don Bosco Database Schema

  1. New Tables
    - `libri` (books)
      - `id` (uuid, primary key) - Unique identifier for each book
      - `titolo` (text) - Book title
      - `autore` (text) - Book author
      - `genere` (text) - Book genre
      - `anno` (integer) - Publication year
      - `copie` (integer) - Number of available copies
      - `created_at` (timestamptz) - Creation timestamp
    
    - `prenotazioni` (reservations)
      - `id` (uuid, primary key) - Unique identifier for each reservation
      - `nome` (text) - First name of person making reservation
      - `cognome` (text) - Last name of person making reservation
      - `libro` (text) - Book title being reserved
      - `stanza` (text) - Room number
      - `data_prenotazione` (date) - Reservation date
      - `data_scadenza` (date) - Due date
      - `created_at` (timestamptz) - Creation timestamp

  2. Security
    - Enable RLS on both tables
    - Add policies for public access (library system is public within the organization)
*/

-- Create libri table
CREATE TABLE IF NOT EXISTS libri (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  titolo text NOT NULL,
  autore text NOT NULL,
  genere text NOT NULL,
  anno integer NOT NULL,
  copie integer NOT NULL DEFAULT 1,
  created_at timestamptz DEFAULT now()
);

-- Create prenotazioni table
CREATE TABLE IF NOT EXISTS prenotazioni (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  nome text NOT NULL,
  cognome text NOT NULL,
  libro text NOT NULL,
  stanza text NOT NULL,
  data_prenotazione date NOT NULL,
  data_scadenza date NOT NULL,
  created_at timestamptz DEFAULT now()
);

-- Enable RLS
ALTER TABLE libri ENABLE ROW LEVEL SECURITY;
ALTER TABLE prenotazioni ENABLE ROW LEVEL SECURITY;

-- Policies for libri table (public access for library management)
CREATE POLICY "Allow public to view books"
  ON libri FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Allow public to insert books"
  ON libri FOR INSERT
  TO public
  WITH CHECK (true);

CREATE POLICY "Allow public to update books"
  ON libri FOR UPDATE
  TO public
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Allow public to delete books"
  ON libri FOR DELETE
  TO public
  USING (true);

-- Policies for prenotazioni table (public access for library management)
CREATE POLICY "Allow public to view reservations"
  ON prenotazioni FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Allow public to insert reservations"
  ON prenotazioni FOR INSERT
  TO public
  WITH CHECK (true);

CREATE POLICY "Allow public to update reservations"
  ON prenotazioni FOR UPDATE
  TO public
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Allow public to delete reservations"
  ON prenotazioni FOR DELETE
  TO public
  USING (true);