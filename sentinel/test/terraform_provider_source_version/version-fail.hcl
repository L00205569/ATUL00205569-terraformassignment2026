mock "tfplan/v2" {
  module {
    source = "mock-pass-tfplan.sentinel"
  }
}

mock "tfconfig/v2" {
  module {
    source = "mock-version-fail-tfconfig.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
