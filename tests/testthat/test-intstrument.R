
test_that('detect instrument', {


  testfiles <-
    list.files(system.file('extdata', package = 'q3ML'), full.names = TRUE)

  expect_true(is.character(detectInstrumentModel(testfiles[1])))

  })
