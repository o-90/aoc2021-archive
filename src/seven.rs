fn main() {
  let in_str: &str = "16,1,2,0,4,2,7,1,2,14";

  // part one
  let v: Vec<i32> = in_str.split(',').map(|x| x.parse::<i32>().unwrap()).collect();
  let v_max = v.iter().max().unwrap();
  let mut min_so_far: i32 = 1000007;
  for i in 1..*v_max {
    let mut count = 0;
    for vs in &v {
      count += (vs - i).abs();
    }
    if count < min_so_far {
      min_so_far = count;
    }
  }
  println!("part one: {:?}", min_so_far);

  // part two
  let mut min_so_far: i32 = 100000007;
  for i in 1..*v_max {
    let mut count = 0;
    for vs in &v {
      count += (vs - i).abs() * ((vs - i).abs() + 1) / 2;
    }
    if count < min_so_far {
      min_so_far = count;
    }
  }
  println!("part two: {:?}", min_so_far);
}
