mock "tfplan/v2" {
  module {
    source = "mock-versioning-fail-tfplan.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
