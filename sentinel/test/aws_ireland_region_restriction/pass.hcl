mock "tfplan/v2" {
  module {
    source = "mock-pass-tfplan.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}
