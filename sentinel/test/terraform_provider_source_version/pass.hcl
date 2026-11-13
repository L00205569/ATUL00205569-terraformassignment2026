mock "tfplan/v2" {
  module {
    source = "mock-pass-tfplan.sentinel"
  }
}

mock "tfconfig/v2" {
  module {
    source = "mock-pass-tfconfig.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}
