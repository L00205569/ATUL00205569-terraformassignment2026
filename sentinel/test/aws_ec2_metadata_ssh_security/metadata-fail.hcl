mock "tfplan/v2" {
  module {
    source = "mock-metadata-fail-tfplan.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
