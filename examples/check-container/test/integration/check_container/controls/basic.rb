control "check_container_file_exists" do
    describe file('./test/fixtures/check_container/test-file') do
      it { should exist }
    end
  end