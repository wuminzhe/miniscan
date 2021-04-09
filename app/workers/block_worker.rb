class BlockWorker
  include Sidekiq::Worker

  def initialize
    @client = SubstrateClient.new Rails.configuration.polkadot.endpoint
  end

  def perform(block_number)
    Rails.logger.info "Start processing block #{block_number}"
    block_hash = @client.chain_getBlockHash(block_number)

    Rails.logger.debug "Its hash is #{block_hash}"
    block = @client.get_block(block_hash)
    puts block.to_json
  rescue => e
    puts e.message
  end

  private
    def get_timestamp(block)
      e = block["block"]["extrinsics_decoded"].find do |e|
        e[:call_module] == "timestamp"
      end

      return if e.blank?
      p = e[:params].find do |p|
        p[:name] == "now"
      end

      return if p.blank?
      p[:value].to_i
    end
end
