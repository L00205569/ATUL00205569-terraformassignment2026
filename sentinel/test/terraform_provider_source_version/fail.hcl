mock "tfplan/v2" {
  module {
    source = "mock-fail-tfplan.sentinel"
  }
}

mock "tfconfig/v2" {
  module {
    source = "mock-fail-tfconfig.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
