//! Sonar Sweep
//! Day 1

/// As the submarine drops below the surface of the ocean, it automatically
/// performs a sonar sweep of the nearby sea floor. On a small screen, the
/// sonar sweep report (your puzzle input) appears: each line is a
/// measurement of the sea floor depth as the sweep looks further and further
/// away from the submarine.
///
/// For example, suppose you had the following report:
///
///    199
///    200
///    208
///    210
///    200
///    207
///    240
///    269
///    260
///    263
///
/// This report indicates that, scanning outward from the submarine, the
/// sonar sweep found depths of 199, 200, 208, 210, and so on.
///
/// The first order of business is to figure out how quickly the depth
/// increases, just so you know what you're dealing with - you never know if
/// the keys will get carried into deeper water by an ocean current or a fish
/// or something.
///
/// In this example, there are 7 measurements that are larger than the
/// previous measurement.
///
/// How many measurements are larger than the previous measurement?

pub fn sonar_sweep_part_one(report: Vec<i32>) -> i32 {
  let mut count = 0;
  for (i, reading) in report.iter().enumerate() {
    if i == 0 {
      continue;
    } else if report[i - 1] < *reading {
      count += 1
    }
  }
  count
}

pub fn sonar_sweep_part_two(report: Vec<i32>) -> i32 {
  let mut current_sum = 0;
  let mut count = 0;
  for reports in report.iter().take(3) {
    current_sum += reports;
  }
  for i in 0..(report.len() - 3) {
    let next_sum = current_sum - report[i] + report[i + 3];
    if current_sum < next_sum {
      count += 1;
    }
    current_sum = next_sum;
  }
  count
}

#[cfg(test)]
mod tests {
  use super::*;
  use crate::utils::read_file;
  #[test]
  fn test_case_example_part_one() {
    let v = vec![199, 200, 208, 210, 200, 207, 240, 269, 260, 263];
    assert_eq!(sonar_sweep_part_one(v), 7);
  }
  #[test]
  fn test_case_actual_part_one() {
    let v = read_file("src/test_cases_one.in").unwrap();
    assert_eq!(sonar_sweep_part_one(v), 1754);
  }
  #[test]
  fn test_case_example_part_two() {
    let v = vec![199, 200, 208, 210, 200, 207, 240, 269, 260, 263];
    assert_eq!(sonar_sweep_part_two(v), 5);
  }
  #[test]
  fn test_case_actual_part_two() {
    let v = read_file("src/test_cases_one.in").unwrap();
    assert_eq!(sonar_sweep_part_two(v), 1789);
  }
}
