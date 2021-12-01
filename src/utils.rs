use std::fs::File;
use std::io::{BufRead, BufReader, Error, ErrorKind};

pub fn read_file(path: &str) -> Result<Vec<i32>, Error> {
  let file = File::open(path)?;
  let reader = BufReader::new(file);
  let mut v = Vec::new();
  for line in reader.lines() {
    let line = line?;
    let num = line
      .trim()
      .parse()
      .map_err(|e| Error::new(ErrorKind::InvalidData, e))?;
    v.push(num);
  }
  Ok(v)
}
