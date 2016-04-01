DOCUMENT SEARCHER
=================

Document searcher will search through the document or documents that are passed to it for terms that appear within
a proximity that a user defines. The document argument may be a single file or a directory of files. This Document Searcher
will only search plain text files that have an extension of '.txt'.

Getting Started
===============

* Download this repository: `git clone https://github.com/stellimatt/document_searcher.git`
* `cd document_searcher`
* run `bundle`
This will get the gems required
* Run `rspec` to execute the tests and gather code coverage

Try it out
==========

I've included a ruby script that will allow you to run the Document Searcher and pass it arbitrary terms and files.
It has a few options that need to be passed to it and these can be found by running `ruby test_ds.rb -h` 
to see output like below

```
Usage: example.rb [options]
    -t, --term1 WORD1                First Term
    -w, --term2 WORD2                Second Term
    -p, --proximity PROXIMITY        number of words between terms
    -d, --directory DIRECTORY        directory or file to examine
```
