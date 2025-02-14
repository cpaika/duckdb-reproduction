fn main() {
    println!("DuckDB test");
}


#[cfg(test)]
mod tests { 
    #[test]
    fn hello() {
        // Need to reference duckdb somewhere so its linked
        let _ = duckdb::Connection::open_in_memory();
        assert_eq!(1, 1);
    }
}