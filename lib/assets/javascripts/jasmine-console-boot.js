var console_reporter = new jasmine.ConsoleReporter();
jasmine.getEnv().addReporter(new jasmine.TrivialReporter());
jasmine.getEnv().addReporter(console_reporter);
