case Merb.environment
when 'development'
  
  Merb.logger.info("Loaded DEVELOPMENT Environment...")
  Merb::Config.use { |c|
    c[:exception_details] = true
    c[:reload_templates] = true
    c[:reload_classes] = true
    c[:reload_time] = 0.5
    c[:ignore_tampered_cookies] = true
    c[:log_auto_flush] = true
    c[:log_level] = :debug

    c[:log_stream] = STDOUT
    c[:log_file]   = nil
    # Or redirect logging into a file:
    # c[:log_file]  = Merb.root / "log" / "development.log"
  }
  
when 'production'
  
  Merb.logger.info("Loaded PRODUCTION Environment...")
  Merb::Config.use { |c|
    c[:exception_details] = false
    c[:reload_classes] = false
    c[:log_level] = :error

    c[:log_file]  = Merb.root / "log" / "production.log"
    # or redirect logger using IO handle
    # c[:log_stream] = STDOUT
  }
  
when 'rake'
  
  Merb.logger.info("Loaded RAKE Environment...")
  Merb::Config.use { |c|
    c[:exception_details] = true
    c[:reload_classes]  = false
    c[:log_auto_flush ] = true

    c[:log_stream] = STDOUT
    c[:log_file]   = nil
    # Or redirect logging into a file:
    # c[:log_file]  = Merb.root / "log" / "rake.log"
  }
  
when 'staging'
  
  Merb.logger.info("Loaded STAGING Environment...")
  Merb::Config.use { |c|
    c[:exception_details] = false
    c[:reload_classes]    = false
    c[:log_level]         = :error

    c[:log_file]  = Merb.root / "log" / "staging.log"
    # or redirect logger using IO handle
    # c[:log_stream] = STDOUT
  }
  
when 'test'

  Merb.logger.info("Loaded TEST Environment...")
  Merb::Config.use { |c|
    c[:testing]           = true
    c[:exception_details] = true
    c[:log_auto_flush ]   = true
    # log less in testing environment
    c[:log_level]         = :error

    #c[:log_file]  = Merb.root / "log" / "test.log"
    # or redirect logger using IO handle
    c[:log_stream] = STDOUT
  }
  
end
