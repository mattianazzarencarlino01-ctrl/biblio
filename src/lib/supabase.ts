import { createClient } from '@supabase/supabase-js';

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
const supabaseKey = import.meta.env.VITE_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
  throw new Error('Missing Supabase environment variables');
}

export const supabase = createClient(supabaseUrl, supabaseKey);
import { createClient } from '@supabase/supabase-js'

// usa le nuove variabili che hai creato
const supabaseUrl = import.meta.env.VITE_SUPABASE_URL_NEW
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY_NEW

export const supabase = createClient(supabaseUrl, supabaseAnonKey)