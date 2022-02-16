
test_that('file versions', {


  testfiles <-
    list.files(system.file('extdata', package = 'q3ML'), pattern = '.mzML', full.names = TRUE)

  expect_true(class(mzR::openMSfile(testfiles[1])) == 'mzRpwiz')
  expect_error(mzR::openMSfile(testfiles[2]))

  expect_null(openFile(testfiles[1]))
  expect_true(is.list(openFile(testfiles[2])))

  mzR_pwiz3_1_hd <- readRDS(system.file('extdata/mzR_hdr.rds', package = 'q3ML'))
  mzR_pwiz3_1_pks <- readRDS(system.file('extdata/mzR_pks.rds', package = 'q3ML'))

  q3ML_pwiz3_2 <- openFile(testfiles[2])

  expect_identical(mzR_pwiz3_1_pks, q3ML_pwiz3_2$peaks)
  expect_identical(mzR_pwiz3_1_hd, q3ML_pwiz3_2$header)


})
