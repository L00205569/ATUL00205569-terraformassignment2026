mock "tfplan/v2" {
  module {
    source = "mock-fail-tfplan.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
