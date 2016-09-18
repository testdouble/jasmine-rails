# Change Log

## [v0.14.0](https://github.com/searls/jasmine-rails/tree/v0.14.0) (2016-09-18)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/v0.13.0...v0.14.0)

**Closed issues:**

- `rake spec:javascript` shouldn't short circuit a chain of rake commands [\#199](https://github.com/searls/jasmine-rails/issues/199)

**Merged pull requests:**

- Updated `rake spec:javascript` so it doesn't short circuit [\#200](https://github.com/searls/jasmine-rails/pull/200) ([jason-o-matic](https://github.com/jason-o-matic))
- Remove Rails 5 request spec params deprecation [\#198](https://github.com/searls/jasmine-rails/pull/198) ([benlovell](https://github.com/benlovell))

## [v0.13.0](https://github.com/searls/jasmine-rails/tree/v0.13.0) (2016-08-30)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/v0.12.6...v0.13.0)

**Closed issues:**

- "phantom\_options: --debug=true" fails with "Invalid values for 'debug' option." [\#192](https://github.com/searls/jasmine-rails/issues/192)

**Merged pull requests:**

- Allow globbing in spec\_dir in jasmine.yml [\#197](https://github.com/searls/jasmine-rails/pull/197) ([f1sherman](https://github.com/f1sherman))

## [v0.12.6](https://github.com/searls/jasmine-rails/tree/v0.12.6) (2016-07-11)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/v0.12.5...v0.12.6)

**Closed issues:**

- Error when running tests [\#196](https://github.com/searls/jasmine-rails/issues/196)

**Merged pull requests:**

- Fix JasmineRails.spec\_files for Sprockets 4 [\#195](https://github.com/searls/jasmine-rails/pull/195) ([djudd](https://github.com/djudd))

## [v0.12.5](https://github.com/searls/jasmine-rails/tree/v0.12.5) (2016-06-22)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/v0.12.4...v0.12.5)

**Closed issues:**

- How to make jasmine-rails find jasmine [\#193](https://github.com/searls/jasmine-rails/issues/193)
- Add Rails 5 to the build matrix [\#188](https://github.com/searls/jasmine-rails/issues/188)

**Merged pull requests:**

- Work around PhantomJS 2 memory consumption issue [\#194](https://github.com/searls/jasmine-rails/pull/194) ([seanlinsley](https://github.com/seanlinsley))
- Add Rails 5 \(beta 3\) to the build [\#190](https://github.com/searls/jasmine-rails/pull/190) ([searls](https://github.com/searls))

## [v0.12.4](https://github.com/searls/jasmine-rails/tree/v0.12.4) (2016-04-07)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/v0.12.3...v0.12.4)

**Closed issues:**

- Variables in erb files [\#186](https://github.com/searls/jasmine-rails/issues/186)
- Issues with Rails 5 [\#185](https://github.com/searls/jasmine-rails/issues/185)
- Phantomjs 2.1.1 segfaults with jasmine-rails [\#184](https://github.com/searls/jasmine-rails/issues/184)
- Should have non-zero return value for failing specs [\#182](https://github.com/searls/jasmine-rails/issues/182)

**Merged pull requests:**

- Fix Rails 5 [\#189](https://github.com/searls/jasmine-rails/pull/189) ([searls](https://github.com/searls))

## [v0.12.3](https://github.com/searls/jasmine-rails/tree/v0.12.3) (2016-02-17)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/v0.12.2...v0.12.3)

**Closed issues:**

- PhantomJS / Jasmine-Rails doesn't exit when run from command line with bundle exec rake spec:javascript [\#155](https://github.com/searls/jasmine-rails/issues/155)

**Merged pull requests:**

- Prevent multiple calls to phantom.exit [\#183](https://github.com/searls/jasmine-rails/pull/183) ([shamus](https://github.com/shamus))

## [v0.12.2](https://github.com/searls/jasmine-rails/tree/v0.12.2) (2015-11-10)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/v0.12.1...v0.12.2)

**Closed issues:**

- Jruby issue with rake task [\#177](https://github.com/searls/jasmine-rails/issues/177)
- New layout in app [\#175](https://github.com/searls/jasmine-rails/issues/175)

**Merged pull requests:**

- JRuby issue fix for bundle exec spec:javascript [\#176](https://github.com/searls/jasmine-rails/pull/176) ([pironim](https://github.com/pironim))

## [v0.12.1](https://github.com/searls/jasmine-rails/tree/v0.12.1) (2015-09-27)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/v0.12.0...v0.12.1)

**Closed issues:**

- Getting "Unsafe JavaScript attempt to access frame" when running specs from the command line [\#153](https://github.com/searls/jasmine-rails/issues/153)
- assets.raise\_runtime\_errors can't be set when running the tests [\#147](https://github.com/searls/jasmine-rails/issues/147)
- Could not find generator jasmine\_rails:install. [\#145](https://github.com/searls/jasmine-rails/issues/145)
- ERROR: TypeError: 'undefined' is not an object \(evaluating 'parent.prototype'\) [\#115](https://github.com/searls/jasmine-rails/issues/115)
- Failing test results in an error message from phantomjs [\#66](https://github.com/searls/jasmine-rails/issues/66)
- rake spec:javascript ran in the wrong rails environment [\#53](https://github.com/searls/jasmine-rails/issues/53)

**Merged pull requests:**

- preserve exit code when running specs in non-test env [\#174](https://github.com/searls/jasmine-rails/pull/174) ([bunnymatic](https://github.com/bunnymatic))
- spec\_runner: target the current version of IE [\#171](https://github.com/searls/jasmine-rails/pull/171) ([henrik](https://github.com/henrik))

## [v0.12.0](https://github.com/searls/jasmine-rails/tree/v0.12.0) (2015-09-19)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/v0.11.0...v0.12.0)

**Closed issues:**

- Unable to find fixtures [\#169](https://github.com/searls/jasmine-rails/issues/169)
- rake spec:javascript when RAILS\_ENV is not test [\#121](https://github.com/searls/jasmine-rails/issues/121)

**Merged pull requests:**

- Ensure rake task runs under RAILS\_ENV=test [\#173](https://github.com/searls/jasmine-rails/pull/173) ([searls](https://github.com/searls))
- Allow passing config yaml file name from environment [\#172](https://github.com/searls/jasmine-rails/pull/172) ([PericlesTheo](https://github.com/PericlesTheo))

## [v0.11.0](https://github.com/searls/jasmine-rails/tree/v0.11.0) (2015-08-10)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/v0.10.8...v0.11.0)

**Closed issues:**

- SpecRunner precompiles assets? [\#168](https://github.com/searls/jasmine-rails/issues/168)
- Tests are run twice in console when using spring [\#165](https://github.com/searls/jasmine-rails/issues/165)
- Testing js-files in isolation: all tests all include application.js?! [\#164](https://github.com/searls/jasmine-rails/issues/164)
- AbsoluteAssetPathError - Asset names passed to helpers should not include the "/assets/" prefix. [\#163](https://github.com/searls/jasmine-rails/issues/163)
- Could not find file spec/javascripts - Sprockets 3.0.0.beta8 [\#159](https://github.com/searls/jasmine-rails/issues/159)

**Merged pull requests:**

- Add another space to src\_files list in jasmine.yml [\#167](https://github.com/searls/jasmine-rails/pull/167) ([spadin](https://github.com/spadin))
- Pass options to phantomjs executable [\#166](https://github.com/searls/jasmine-rails/pull/166) ([danieltdt](https://github.com/danieltdt))
- Ensure `RAILS\_ENV` is set to `test` when running tests [\#162](https://github.com/searls/jasmine-rails/pull/162) ([rudyjahchan](https://github.com/rudyjahchan))

## [v0.10.8](https://github.com/searls/jasmine-rails/tree/v0.10.8) (2015-04-11)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/v0.10.7...v0.10.8)

**Closed issues:**

- jasmine-rails stuck in a loop [\#161](https://github.com/searls/jasmine-rails/issues/161)
- "can't load the address!" error in jasmine-runner.js when using phantomjs 2.0 [\#158](https://github.com/searls/jasmine-rails/issues/158)

## [v0.10.7](https://github.com/searls/jasmine-rails/tree/v0.10.7) (2015-02-09)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/v0.10.6...v0.10.7)

**Closed issues:**

- Getting routing error on trying to launch simple test [\#157](https://github.com/searls/jasmine-rails/issues/157)
- SPEC=spec/individual/test.js.coffee not working [\#142](https://github.com/searls/jasmine-rails/issues/142)

## [v0.10.6](https://github.com/searls/jasmine-rails/tree/v0.10.6) (2015-01-09)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/v0.10.5...v0.10.6)

**Closed issues:**

- jasmine-rails is not detecting any specs [\#152](https://github.com/searls/jasmine-rails/issues/152)
- Avoid downloading PhantomJS [\#133](https://github.com/searls/jasmine-rails/issues/133)

**Merged pull requests:**

- Add option to not use the PhantomJS gem executable [\#154](https://github.com/searls/jasmine-rails/pull/154) ([edds](https://github.com/edds))

## [v0.10.5](https://github.com/searls/jasmine-rails/tree/v0.10.5) (2014-12-18)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/v0.10.4...v0.10.5)

**Merged pull requests:**

- revert PR \#150 - was causing incorrect failed count when pending or skipped specs are present [\#151](https://github.com/searls/jasmine-rails/pull/151) ([larsklevan](https://github.com/larsklevan))

## [v0.10.4](https://github.com/searls/jasmine-rails/tree/v0.10.4) (2014-12-11)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/v0.10.3...v0.10.4)

**Merged pull requests:**

- fix failed count in ConsoleReporter when there are skipped\_or\_pending\_specs [\#150](https://github.com/searls/jasmine-rails/pull/150) ([larsklevan](https://github.com/larsklevan))

## [v0.10.3](https://github.com/searls/jasmine-rails/tree/v0.10.3) (2014-12-04)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/v0.10.2...v0.10.3)

**Closed issues:**

- Slow test runs with large apps [\#148](https://github.com/searls/jasmine-rails/issues/148)
- what version of Jasmine is this? \(can this be documented in the README\) [\#144](https://github.com/searls/jasmine-rails/issues/144)
- trouble running tests from CLI [\#141](https://github.com/searls/jasmine-rails/issues/141)

**Merged pull requests:**

- Add "defer" to all javascript tags [\#149](https://github.com/searls/jasmine-rails/pull/149) ([searls](https://github.com/searls))

## [v0.10.2](https://github.com/searls/jasmine-rails/tree/v0.10.2) (2014-08-21)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/v0.10.1...v0.10.2)

**Merged pull requests:**

- Turn off for turbolinks [\#138](https://github.com/searls/jasmine-rails/pull/138) ([ValMilkevich](https://github.com/ValMilkevich))

## [v0.10.1](https://github.com/searls/jasmine-rails/tree/v0.10.1) (2014-08-21)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/v0.10.0...v0.10.1)

**Merged pull requests:**

- Protect against nil source in offline\_asset\_paths [\#143](https://github.com/searls/jasmine-rails/pull/143) ([werkshy](https://github.com/werkshy))

## [v0.10.0](https://github.com/searls/jasmine-rails/tree/v0.10.0) (2014-08-04)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/v0.9.1...v0.10.0)

**Merged pull requests:**

- Add support for external source [\#139](https://github.com/searls/jasmine-rails/pull/139) ([randoum](https://github.com/randoum))

## [v0.9.1](https://github.com/searls/jasmine-rails/tree/v0.9.1) (2014-07-02)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/v0.9.0...v0.9.1)

**Closed issues:**

- Indecipherable test output [\#136](https://github.com/searls/jasmine-rails/issues/136)
- Tests not running [\#134](https://github.com/searls/jasmine-rails/issues/134)

**Merged pull requests:**

- Replace Function.prototype.bind polyfill with one that works for the latest version of Phantomjs [\#137](https://github.com/searls/jasmine-rails/pull/137) ([eomuraliev](https://github.com/eomuraliev))
- Fix README references to SpecRunnerHelper [\#135](https://github.com/searls/jasmine-rails/pull/135) ([cmaher](https://github.com/cmaher))
- Modify some deprecated names on README.md [\#132](https://github.com/searls/jasmine-rails/pull/132) ([debbbbie](https://github.com/debbbbie))
- Update README.md [\#131](https://github.com/searls/jasmine-rails/pull/131) ([debbbbie](https://github.com/debbbbie))
- Update README.md [\#129](https://github.com/searls/jasmine-rails/pull/129) ([debbbbie](https://github.com/debbbbie))

## [v0.9.0](https://github.com/searls/jasmine-rails/tree/v0.9.0) (2014-05-12)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/v0.8.1...v0.9.0)

**Closed issues:**

- Allow adding reporters [\#126](https://github.com/searls/jasmine-rails/issues/126)

**Merged pull requests:**

- Fix typos, links, and small style in README [\#128](https://github.com/searls/jasmine-rails/pull/128) ([shepmaster](https://github.com/shepmaster))
- Allow specifying which reporters to use. Fixes \#126 [\#127](https://github.com/searls/jasmine-rails/pull/127) ([shepmaster](https://github.com/shepmaster))

## [v0.8.1](https://github.com/searls/jasmine-rails/tree/v0.8.1) (2014-05-10)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/v0.8.0...v0.8.1)

**Merged pull requests:**

- replaces rails with railties [\#119](https://github.com/searls/jasmine-rails/pull/119) ([langalex](https://github.com/langalex))

## [v0.8.0](https://github.com/searls/jasmine-rails/tree/v0.8.0) (2014-05-10)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/v0.7.2...v0.8.0)

**Closed issues:**

- rake task downloading phantomjs even though binary is on path [\#124](https://github.com/searls/jasmine-rails/issues/124)

**Merged pull requests:**

- Attempts to load in custom helper functions [\#125](https://github.com/searls/jasmine-rails/pull/125) ([ryanmcilmoyl](https://github.com/ryanmcilmoyl))

## [v0.7.2](https://github.com/searls/jasmine-rails/tree/v0.7.2) (2014-05-05)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/v0.7.1...v0.7.2)

**Closed issues:**

- Jasmine and force\_ssl [\#61](https://github.com/searls/jasmine-rails/issues/61)

## [v0.7.1](https://github.com/searls/jasmine-rails/tree/v0.7.1) (2014-04-26)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/v0.7.0...v0.7.1)

**Closed issues:**

- Unable to mount JasmineRails::Engine [\#120](https://github.com/searls/jasmine-rails/issues/120)

## [v0.7.0](https://github.com/searls/jasmine-rails/tree/v0.7.0) (2014-04-12)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/v0.6.2...v0.7.0)

**Merged pull requests:**

- Add support for CSS files in Jasmine suite [\#118](https://github.com/searls/jasmine-rails/pull/118) ([jcarlson](https://github.com/jcarlson))

## [v0.6.2](https://github.com/searls/jasmine-rails/tree/v0.6.2) (2014-04-12)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/v0.6.1...v0.6.2)

**Closed issues:**

- Javascript-template files \(HAMLC, ECO etc.\) [\#113](https://github.com/searls/jasmine-rails/issues/113)
- Breaks when Turbolinks is enabled. [\#109](https://github.com/searls/jasmine-rails/issues/109)
- confused to import a js file from /vendor [\#103](https://github.com/searls/jasmine-rails/issues/103)

**Merged pull requests:**

- Add support for config.force\_ssl [\#110](https://github.com/searls/jasmine-rails/pull/110) ([charypar](https://github.com/charypar))

## [v0.6.1](https://github.com/searls/jasmine-rails/tree/v0.6.1) (2014-04-12)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/v0.6.0...v0.6.1)

**Closed issues:**

- Add rails 4.1.0 support [\#117](https://github.com/searls/jasmine-rails/issues/117)
- Allow custom CSS [\#116](https://github.com/searls/jasmine-rails/issues/116)
- rake spec:javascript not finding homebrew's phantomjs [\#114](https://github.com/searls/jasmine-rails/issues/114)
- ConsoleReporter displays "failure" message \(yet exits with status code 0\) if tests are marked as pending [\#111](https://github.com/searls/jasmine-rails/issues/111)
- Problem running jasmine-rails from console on ubuntu with backported sprockets in rails 4 [\#108](https://github.com/searls/jasmine-rails/issues/108)
- TypeError: has no method 'andCallFake' [\#107](https://github.com/searls/jasmine-rails/issues/107)
- jasmine\_rails:install generator not found on fresh install [\#105](https://github.com/searls/jasmine-rails/issues/105)
- Update to Jasmine 2.0 [\#93](https://github.com/searls/jasmine-rails/issues/93)

**Merged pull requests:**

- ConsoleReporter displays failure message \(yet exits with status code 0\) if tests are marked as pending [\#112](https://github.com/searls/jasmine-rails/pull/112) ([laser](https://github.com/laser))

## [v0.6.0](https://github.com/searls/jasmine-rails/tree/v0.6.0) (2014-02-20)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/v0.5.6...v0.6.0)

**Closed issues:**

- jasmine-rails breaks when jasmine-jquery updates to v2 [\#106](https://github.com/searls/jasmine-rails/issues/106)

## [v0.5.6](https://github.com/searls/jasmine-rails/tree/v0.5.6) (2014-02-11)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/v0.5.5...v0.5.6)

**Merged pull requests:**

- Create runner path if it doesn't exist [\#104](https://github.com/searls/jasmine-rails/pull/104) ([RKushnir](https://github.com/RKushnir))

## [v0.5.5](https://github.com/searls/jasmine-rails/tree/v0.5.5) (2014-02-02)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/0.5.4...v0.5.5)

**Closed issues:**

- src\_files is silently ignored [\#100](https://github.com/searls/jasmine-rails/issues/100)
- wrong constant name JasmineRails/specRunnerController when running under Rails 3.1.12 [\#99](https://github.com/searls/jasmine-rails/issues/99)

**Merged pull requests:**

- Change default spec runner location to tmp/jasmine directory [\#101](https://github.com/searls/jasmine-rails/pull/101) ([wireframe](https://github.com/wireframe))

## [0.5.4](https://github.com/searls/jasmine-rails/tree/0.5.4) (2014-01-06)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/0.5.3...0.5.4)

## [0.5.3](https://github.com/searls/jasmine-rails/tree/0.5.3) (2014-01-06)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/0.5.2...0.5.3)

**Closed issues:**

- Where does spec/javascripts/helpers/spec\_helper.js come from? [\#97](https://github.com/searls/jasmine-rails/issues/97)
- Dummy project link is broken in readme [\#96](https://github.com/searls/jasmine-rails/issues/96)

**Merged pull requests:**

- use phantomjs path if it's not in PATH [\#98](https://github.com/searls/jasmine-rails/pull/98) ([sinisterchipmunk](https://github.com/sinisterchipmunk))
- asset\_path helper in tests fail due to computed path being hardcoded [\#95](https://github.com/searls/jasmine-rails/pull/95) ([Dishwasha](https://github.com/Dishwasha))

## [0.5.2](https://github.com/searls/jasmine-rails/tree/0.5.2) (2014-01-06)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/0.5.1...0.5.2)

**Closed issues:**

- RAISED "\xFF" from ASCII-8BIT to UTF-8 [\#64](https://github.com/searls/jasmine-rails/issues/64)

**Merged pull requests:**

- add jasmine\_rails:install generator to setup Rails project. [\#94](https://github.com/searls/jasmine-rails/pull/94) ([wireframe](https://github.com/wireframe))

## [0.5.1](https://github.com/searls/jasmine-rails/tree/0.5.1) (2013-12-06)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/0.5.0...0.5.1)

**Merged pull requests:**

- Make the tmp dir configurable [\#92](https://github.com/searls/jasmine-rails/pull/92) ([shariffy](https://github.com/shariffy))

## [0.5.0](https://github.com/searls/jasmine-rails/tree/0.5.0) (2013-11-25)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/0.4.9...0.5.0)

**Closed issues:**

- Assets compiled in assets folder and not cleaned up [\#60](https://github.com/searls/jasmine-rails/issues/60)

**Merged pull requests:**

- Add Rspec save\_fixture helper for generating jasmine html fixtures. [\#90](https://github.com/searls/jasmine-rails/pull/90) ([wireframe](https://github.com/wireframe))

## [0.4.9](https://github.com/searls/jasmine-rails/tree/0.4.9) (2013-11-08)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/0.4.8...0.4.9)

**Closed issues:**

- Duplicated - remove please [\#88](https://github.com/searls/jasmine-rails/issues/88)

**Merged pull requests:**

- removed file:// from command run, windows does not recognise this prefix... [\#87](https://github.com/searls/jasmine-rails/pull/87) ([azzamallow](https://github.com/azzamallow))
- open file to write with binary flag [\#86](https://github.com/searls/jasmine-rails/pull/86) ([azzamallow](https://github.com/azzamallow))

## [0.4.8](https://github.com/searls/jasmine-rails/tree/0.4.8) (2013-10-31)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/0.4.7...0.4.8)

**Closed issues:**

- testbed gemfiles always conflict [\#81](https://github.com/searls/jasmine-rails/issues/81)
- Unable to complete "bundle install" [\#78](https://github.com/searls/jasmine-rails/issues/78)
- phantomjs runner executes my tests twice [\#28](https://github.com/searls/jasmine-rails/issues/28)

**Merged pull requests:**

- point travis to our little shell script [\#85](https://github.com/searls/jasmine-rails/pull/85) ([searls](https://github.com/searls))
- Only run rails 4 tests a single time from the command line [\#83](https://github.com/searls/jasmine-rails/pull/83) ([zmoazeni](https://github.com/zmoazeni))
- Bumps jasmine-rails version in the testbed lock files [\#82](https://github.com/searls/jasmine-rails/pull/82) ([zmoazeni](https://github.com/zmoazeni))
- Uses ssl version of rubygems instead of http [\#80](https://github.com/searls/jasmine-rails/pull/80) ([zmoazeni](https://github.com/zmoazeni))
- Fixes `bundle install` now that Rails v4.x is live [\#79](https://github.com/searls/jasmine-rails/pull/79) ([zmoazeni](https://github.com/zmoazeni))

## [0.4.7](https://github.com/searls/jasmine-rails/tree/0.4.7) (2013-10-22)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/v0.4.6...0.4.7)

**Closed issues:**

- Use erb within a spec [\#75](https://github.com/searls/jasmine-rails/issues/75)
- License missing from gemspec [\#71](https://github.com/searls/jasmine-rails/issues/71)
- Is it possible to overwrite the spec runner? [\#65](https://github.com/searls/jasmine-rails/issues/65)
- jasmine-spec.js.erb should not minify test-only JS  [\#62](https://github.com/searls/jasmine-rails/issues/62)
- is there a way to output results to an html file? [\#57](https://github.com/searls/jasmine-rails/issues/57)
- Deprecation warning: Rails 4 compatibility [\#54](https://github.com/searls/jasmine-rails/issues/54)

**Merged pull requests:**

- added clarification for require [\#77](https://github.com/searls/jasmine-rails/pull/77) ([leeacto](https://github.com/leeacto))
- Better compatible shim for Function.prototype.bind [\#76](https://github.com/searls/jasmine-rails/pull/76) ([UncleGene](https://github.com/UncleGene))
- javascripts at the bottom of the \<body\> [\#73](https://github.com/searls/jasmine-rails/pull/73) ([losingkeys](https://github.com/losingkeys))
- fix running jasmine when the asset\_host is set in test environment [\#72](https://github.com/searls/jasmine-rails/pull/72) ([wireframe](https://github.com/wireframe))
- minor typo fixed [\#70](https://github.com/searls/jasmine-rails/pull/70) ([dguzzo](https://github.com/dguzzo))

## [v0.4.6](https://github.com/searls/jasmine-rails/tree/v0.4.6) (2013-09-09)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/v0.4.5...v0.4.6)

**Closed issues:**

- Function.prototype.bind undefined for command line / phantomjs [\#68](https://github.com/searls/jasmine-rails/issues/68)
- .js.coffee extentions [\#56](https://github.com/searls/jasmine-rails/issues/56)
- Jasmine runner at '/specs' returned a 500 error [\#52](https://github.com/searls/jasmine-rails/issues/52)
- jasmine-rails not compatible with Rails 3 [\#50](https://github.com/searls/jasmine-rails/issues/50)
- Changelog request [\#32](https://github.com/searls/jasmine-rails/issues/32)
- browser not loading specs / assets [\#8](https://github.com/searls/jasmine-rails/issues/8)

**Merged pull requests:**

- Added polyfill for Function.prototype.bind [\#69](https://github.com/searls/jasmine-rails/pull/69) ([rymohr](https://github.com/rymohr))
- extract JasmineRails::Runner to support alternative non-rake test runner... [\#67](https://github.com/searls/jasmine-rails/pull/67) ([wireframe](https://github.com/wireframe))
- fix broken link in README. [\#63](https://github.com/searls/jasmine-rails/pull/63) ([ccallebs](https://github.com/ccallebs))
- Fix DEPRECATION WARNING for rails 4.0.0. ActionController::Integration t... [\#58](https://github.com/searls/jasmine-rails/pull/58) ([zeisler](https://github.com/zeisler))
- Allow for jasmine.yml to be in 'config/' instead of 'spec/javascripts/support/' [\#51](https://github.com/searls/jasmine-rails/pull/51) ([chrisnicola](https://github.com/chrisnicola))
- Avoid clashing with main ApplicationController [\#49](https://github.com/searls/jasmine-rails/pull/49) ([bcardiff](https://github.com/bcardiff))
- Minor documentation tweak [\#48](https://github.com/searls/jasmine-rails/pull/48) ([wbyoung](https://github.com/wbyoung))
- tweak to console reporter to use top spec descriptions only [\#45](https://github.com/searls/jasmine-rails/pull/45) ([doryphores](https://github.com/doryphores))
- \[README\] Indicate that the example spec is a JavaScript file. [\#44](https://github.com/searls/jasmine-rails/pull/44) ([strand](https://github.com/strand))

## [v0.4.5](https://github.com/searls/jasmine-rails/tree/v0.4.5) (2013-05-28)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/v0.4.4...v0.4.5)

**Closed issues:**

- compute\_public\_path\_with\_offline\_asset doesn't work with symbols [\#41](https://github.com/searls/jasmine-rails/issues/41)
- Is Jasmine's routing available in production? [\#38](https://github.com/searls/jasmine-rails/issues/38)

**Merged pull requests:**

- Allow symbols for source files [\#43](https://github.com/searls/jasmine-rails/pull/43) ([eheikes](https://github.com/eheikes))

## [v0.4.4](https://github.com/searls/jasmine-rails/tree/v0.4.4) (2013-05-23)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/0.4.3...v0.4.4)

**Merged pull requests:**

- jasmine-rails should not override the application's assets.debug config [\#37](https://github.com/searls/jasmine-rails/pull/37) ([smathieu](https://github.com/smathieu))

## [0.4.3](https://github.com/searls/jasmine-rails/tree/0.4.3) (2013-05-13)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/0.4.2...0.4.3)

**Closed issues:**

- Jasmine runner at '/specs' returned a 404 error: Not Found [\#36](https://github.com/searls/jasmine-rails/issues/36)
- Testing two separate JS apps [\#34](https://github.com/searls/jasmine-rails/issues/34)

**Merged pull requests:**

- Testbeds with rails 4 [\#35](https://github.com/searls/jasmine-rails/pull/35) ([sinisterchipmunk](https://github.com/sinisterchipmunk))

## [0.4.2](https://github.com/searls/jasmine-rails/tree/0.4.2) (2013-04-25)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/0.4.1...0.4.2)

**Merged pull requests:**

- Fixed phantomjs execution for paths with spaces [\#31](https://github.com/searls/jasmine-rails/pull/31) ([dandehavilland](https://github.com/dandehavilland))

## [0.4.1](https://github.com/searls/jasmine-rails/tree/0.4.1) (2013-04-25)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/0.4.0...0.4.1)

**Closed issues:**

- spec:javascripts errors in Rails 3.1 [\#30](https://github.com/searls/jasmine-rails/issues/30)
- rake spec:javascript\(s\) do not exist [\#29](https://github.com/searls/jasmine-rails/issues/29)
- Incorrect asset path in Rails 4 beta [\#17](https://github.com/searls/jasmine-rails/issues/17)
- jasmine-rails compiles C-Extension for QT, after gem has loaded even though QT is not being used [\#16](https://github.com/searls/jasmine-rails/issues/16)
- New project experience: browser spec runner requires \> 0 source files [\#13](https://github.com/searls/jasmine-rails/issues/13)

## [0.4.0](https://github.com/searls/jasmine-rails/tree/0.4.0) (2013-04-18)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/0.3.3...0.4.0)

**Closed issues:**

- Running tests in browser is very very slow [\#23](https://github.com/searls/jasmine-rails/issues/23)

**Merged pull requests:**

- use def-rescue instead of begin-rescue [\#27](https://github.com/searls/jasmine-rails/pull/27) ([bonsaiben](https://github.com/bonsaiben))
- Phantomjs Headless Runner [\#25](https://github.com/searls/jasmine-rails/pull/25) ([wireframe](https://github.com/wireframe))
- Enable browser caching [\#24](https://github.com/searls/jasmine-rails/pull/24) ([rymohr](https://github.com/rymohr))

## [0.3.3](https://github.com/searls/jasmine-rails/tree/0.3.3) (2013-03-06)
[Full Changelog](https://github.com/searls/jasmine-rails/compare/0.2.3...0.3.3)

**Closed issues:**

- Upgrade to jasmine-core \(~\> 1.3.1\) config error [\#19](https://github.com/searls/jasmine-rails/issues/19)
- Rails.application.assets nil [\#18](https://github.com/searls/jasmine-rails/issues/18)
- Error: Sprockets::FileOutsidePaths [\#4](https://github.com/searls/jasmine-rails/issues/4)

**Merged pull requests:**

- Fix for rails 3 2 stable [\#26](https://github.com/searls/jasmine-rails/pull/26) ([keithpitt](https://github.com/keithpitt))
- don't pass out nil paths from calls to asset\_paths as that kills app boot [\#22](https://github.com/searls/jasmine-rails/pull/22) ([leemhenson](https://github.com/leemhenson))

## [0.2.3](https://github.com/searls/jasmine-rails/tree/0.2.3) (2012-12-05)
**Closed issues:**

- Rakefile seems wack [\#21](https://github.com/searls/jasmine-rails/issues/21)
- Fixtures support. [\#15](https://github.com/searls/jasmine-rails/issues/15)
- Jasmine includes sprocket files twice. [\#14](https://github.com/searls/jasmine-rails/issues/14)
- Erroneous jasmine.rake warning [\#7](https://github.com/searls/jasmine-rails/issues/7)
- jasmine\_rails/application.js won't compile because of missing prototype.js [\#1](https://github.com/searls/jasmine-rails/issues/1)

**Merged pull requests:**

- Tidy up Guard section of README. [\#10](https://github.com/searls/jasmine-rails/pull/10) ([xaviershay](https://github.com/xaviershay))
- reload for any file change [\#9](https://github.com/searls/jasmine-rails/pull/9) ([gerad](https://github.com/gerad))
- Fix closing tag [\#6](https://github.com/searls/jasmine-rails/pull/6) ([ayosec](https://github.com/ayosec))
- Set src\_dir to jasmine look for application javascripts   [\#5](https://github.com/searls/jasmine-rails/pull/5) ([fnmunhoz](https://github.com/fnmunhoz))
- Gemspec update w.r.t. Readme file [\#3](https://github.com/searls/jasmine-rails/pull/3) ([DMajrekar](https://github.com/DMajrekar))
- Allow jasmine-rails to work with Rails 3.2. [\#2](https://github.com/searls/jasmine-rails/pull/2) ([bigjason](https://github.com/bigjason))



\* *This Change Log was automatically generated by [github_changelog_generator](https://github.com/skywinder/Github-Changelog-Generator)*