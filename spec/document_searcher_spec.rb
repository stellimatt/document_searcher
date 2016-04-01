require 'rspec'

require_relative '../document_searcher'

describe DocumentSearcher do

  describe '#search_for_localized_terms' do
    context 'when empty document' do
      it 'returns false' do
        empty_document = "testfiles/empty.txt"
        document_searcher = DocumentSearcher.new(empty_document)

        found = document_searcher.searchForLocalizedTerms('term1', 'term2')
        expect(found).to be false
      end
    end

    context 'when document does not exist' do
      it 'returns false' do
        non_existent_doc = "testfiles/non_existent.txt"
        document_searcher = DocumentSearcher.new(non_existent_doc)

        found = document_searcher.searchForLocalizedTerms('term1', 'term2')
        expect(found).to be false
      end
    end

    context 'when terms within limit' do
      it 'returns file.txt' do
        file1 = "testfiles/file.txt"
        document_searcher = DocumentSearcher.new(file1)

        found = document_searcher.searchForLocalizedTerms('magic', 'thought')
        expect(found).to eq ["testfiles/file.txt"]
      end
    end

    context 'when terms outside limit' do
      it 'returns false' do
        file1 = "testfiles/file.txt"
        document_searcher = DocumentSearcher.new(file1, 3)

        found = document_searcher.searchForLocalizedTerms('magic', 'thought')
        expect(found).to be false
      end
    end

    context 'when terms do not exist in document' do
      it 'returns false' do
        file1 = "testfiles/file.txt"
        document_searcher = DocumentSearcher.new(file1)

        found = document_searcher.searchForLocalizedTerms('term1', 'term2')
        expect(found).to be false
      end
    end

    context 'when terms within limit on directory' do
      it 'returns testfiles/file.txt' do
        file1 = "testfiles"
        document_searcher = DocumentSearcher.new(file1)

        found = document_searcher.searchForLocalizedTerms('magic', 'thought')
        expect(found).to eq ["testfiles/file.txt"]
      end
    end

    context 'when term starts with a double quote' do
      it 'returns testfiles/file.txt' do
        file1 = "testfiles"
        document_searcher = DocumentSearcher.new(file1)

        found = document_searcher.searchForLocalizedTerms('generally', 'owners')
        expect(found).to eq ["testfiles/file.txt"]
      end
    end

    context 'when terms in separate paragraphs' do
      it 'returns testfiles/file.txt' do
        file1 = "testfiles"
        document_searcher = DocumentSearcher.new(file1, 20)

        found = document_searcher.searchForLocalizedTerms('murderous', 'stories')
        expect(found).to eq ["testfiles/file.txt"]
      end
    end

    context 'first and last word of document' do
      it 'returns testfiles/file.txt' do
        file1 = "testfiles"
        document_searcher = DocumentSearcher.new(file1, 1000)

        found = document_searcher.searchForLocalizedTerms('north', 'end')
        expect(found).to eq ["testfiles/file.txt"]
      end
    end
  end
end
