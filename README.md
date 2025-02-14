## DuckDB Linking Issue Reproduction
### Seeing the issue with 1.2.0

To run:
`docker buildx build -f Dockerfile .`

You should see it fail with a linking issue like this:
```
 > [8/8] RUN $HOME/.cargo/bin/cargo test:
266.3   = note: /usr/bin/ld: /app/target/debug/deps/liblibduckdb_sys-f5c8fd0dd29e7ad5.rlib(d72e143842620a4d-ub_src_planner_expression.o): in function `void duckdb::DynamicCastCheck<duckdb::ListLambdaBindData, duckdb::FunctionData>(duckdb::FunctionData const*)':
266.3           /app/target/debug/build/libduckdb-sys-51da510693e3ab30/out/duckdb/src/include/duckdb/common/helper.hpp:262: undefined reference to `typeinfo for duckdb::ListLambdaBindData'
266.3           /usr/bin/ld: /app/target/debug/build/libduckdb-sys-51da510693e3ab30/out/duckdb/src/include/duckdb/common/helper.hpp:262: undefined reference to `typeinfo for duckdb::ListLambdaBindData'
266.3           collect2: error: ld returned 1 exit status
266.3
266.3   = note: some `extern` functions couldn't be found; some native libraries may need to be installed or have their path specified
266.3   = note: use the `-l` flag to specify native libraries to link
266.3   = note: use the `cargo:rustc-link-lib` directive to specify the native libraries to link with Cargo (see https://doc.rust-lang.org/cargo/reference/build-scripts.html#rustc-link-lib)
266.3
266.4 error: could not compile `duckdb-repro` (bin "duckdb-repro" test) due to 1 previous error
Dockerfile:23
```

### No issue with 1.1.1
If you downgrade the duckdb version in the Cargo.toml and rerun, you should see it pass:
`docker buildx build -f Dockerfile .`