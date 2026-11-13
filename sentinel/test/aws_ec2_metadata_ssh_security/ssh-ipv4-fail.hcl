mock "tfplan/v2" {
  module {
    source = "mock-ssh-ipv4-fail-tfplan.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
