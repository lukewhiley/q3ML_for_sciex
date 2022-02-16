
test_that('file versions', {


  testfile <-
    list.files(system.file('extdata', package = 'q3ML'), pattern = '.mzML', full.names = TRUE)

  q3ML_pwiz3_2 <- openFile(testfile)

  expect_true(is.list(q3ML_pwiz3_2))

  mzR_pwiz3_1_hd <- readRDS(system.file('extdata/mzR_hdr.rds', package = 'q3ML'))
  mzR_pwiz3_1_pks <- readRDS(system.file('extdata/mzR_pks.rds', package = 'q3ML'))

  q3ML_pwiz3_2 <- openFile(testfile)

  expect_identical(mzR_pwiz3_1_pks, q3ML_pwiz3_2$peaks)
  expect_identical(mzR_pwiz3_1_hd, q3ML_pwiz3_2$header)


})
