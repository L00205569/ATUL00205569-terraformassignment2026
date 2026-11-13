mock "tfplan/v2" {
  module {
    source = "mock-encryption-fail-tfplan.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
