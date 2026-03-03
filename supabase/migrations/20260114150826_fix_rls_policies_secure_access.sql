/*
  # Fix Security Issues - RLS Policies

  ## Overview
  This migration addresses critical security vulnerabilities in RLS policies:
  1. Removes insecure RLS policies that allow unrestricted access (USING true)
  2. Implements secure RLS policies that only allow service role access for mutations
  3. Maintains public read access for catalog and reservations viewing

  ## Changes to `libri` (Books) Table
  - **Removed Policies**: All insecure policies allowing unrestricted INSERT, UPDATE, DELETE
  - **New Policies**: 
    - SELECT: Public read access (anyone can view the catalog)
    - INSERT/UPDATE/DELETE: Only service role (used by edge functions with password protection)

  ## Changes to `prenotazioni` (Reservations) Table  
  - **Removed Policies**: All insecure policies allowing unrestricted INSERT, UPDATE, DELETE
  - **New Policies**:
    - SELECT: Public read access (anyone can view reservations)
    - INSERT/UPDATE/DELETE: Only service role (used by edge functions with password protection)

  ## Security Model
  All mutations (create, update, delete) now go through edge functions that:
  - Validate a password before allowing operations
  - Use the service role key to bypass RLS
  - Provide centralized authorization logic

  ## Note on Auth Connection Strategy
  The Auth DB connection pool configuration must be changed through Supabase Dashboard:
  Settings > Database > Connection Pooling > Change from fixed "10" to percentage-based allocation
*/

-- Drop all existing insecure policies for libri table
DROP POLICY IF EXISTS "Allow public to insert books" ON libri;
DROP POLICY IF EXISTS "Allow public to update books" ON libri;
DROP POLICY IF EXISTS "Allow public to delete books" ON libri;

-- Drop all existing insecure policies for prenotazioni table  
DROP POLICY IF EXISTS "Allow public to insert reservations" ON prenotazioni;
DROP POLICY IF EXISTS "Allow public to update reservations" ON prenotazioni;
DROP POLICY IF EXISTS "Allow public to delete reservations" ON prenotazioni;

-- Create secure policies for libri table
-- Public read access remains (catalog viewing is public)
-- Note: "Allow public to view books" policy already exists

-- Only service role can insert books (via edge functions)
CREATE POLICY "Service role can insert books"
  ON libri FOR INSERT
  TO service_role
  WITH CHECK (true);

-- Only service role can update books (via edge functions)
CREATE POLICY "Service role can update books"
  ON libri FOR UPDATE
  TO service_role
  USING (true)
  WITH CHECK (true);

-- Only service role can delete books (via edge functions)
CREATE POLICY "Service role can delete books"
  ON libri FOR DELETE
  TO service_role
  USING (true);

-- Create secure policies for prenotazioni table
-- Public read access remains (viewing reservations is public)
-- Note: "Allow public to view reservations" policy already exists

-- Only service role can insert reservations (via edge functions)
CREATE POLICY "Service role can insert reservations"
  ON prenotazioni FOR INSERT
  TO service_role
  WITH CHECK (true);

-- Only service role can update reservations (via edge functions)
CREATE POLICY "Service role can update reservations"
  ON prenotazioni FOR UPDATE
  TO service_role
  USING (true)
  WITH CHECK (true);

-- Only service role can delete reservations (via edge functions)
CREATE POLICY "Service role can delete reservations"
  ON prenotazioni FOR DELETE
  TO service_role
  USING (true);
