mock "tfplan/v2" {
  module {
    source = "mock-root-volume-fail-tfplan.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
