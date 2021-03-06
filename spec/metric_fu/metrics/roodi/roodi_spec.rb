require "spec_helper"
MetricFu.metrics_require { 'roodi/roodi' }

describe MetricFu::RoodiGenerator do
  describe "emit" do
    it "should add config options when present" do
      options = {:roodi_config => 'lib/config/roodi_config.yml', :dirs_to_roodi => []}
      roodi = MetricFu::RoodiGenerator.new(options)
      expect(roodi).to receive(:run!).with(/-config=lib\/config\/roodi_config\.yml/).and_return("")
      roodi.emit
    end

    it "should NOT add config options when NOT present" do
      options = {:dirs_to_roodi => []}
      roodi = MetricFu::RoodiGenerator.new(options)
      allow(roodi).to receive(:run!)
      expect(roodi).to receive(:run!).with(/-config/).never
      roodi.emit
    end
  end
end
