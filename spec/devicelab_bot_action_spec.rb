describe Fastlane::Actions::DevicelabBotAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The devicelab_bot plugin is working!")

      Fastlane::Actions::DevicelabBotAction.run(nil)
    end
  end
end
