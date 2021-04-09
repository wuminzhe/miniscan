class ChainManager

  def self.create_block(block_number)
    client = SubstrateClient.new Rails.configuration.polkadot.endpoint
    block_hash = client.chain_getBlockHash(block_number)
    block = client.get_block(block_hash)

    extrinsics = block["block"]['extrinsics_decoded'].map do |ex|
      puts "---------------"
      puts ex.to_json

      Extrinsic.new(
        index: ex[:call_index],
        block_number: block_number,
        length: ex[:extrinsic_length],
        version_info: ex[:version_info],
        module: ex[:call_module],
        function: ex[:call_function],
        params_raw: ex[:params_raw],
        params: ex[:params].to_json,
        account_id: ex[:address],
        signature: ex[:signature][:value],
        nonce: ex[:nonce],
        era: ex[:era],
        hash: ex[:extrinsic_hash],
        is_signed: ex[:signature].present?,
        # success: 

      )
    end
    
    # raw_events, events = client.get_block_events(block_hash)
    # event_objs = []
    # events.each_with_index do |event, i|
    #   event_objs << Event.new({
    #     index: event[:event_index],
    #     idx: i,
    #     block_number: block_number,
    #     extrinsic_idx: event[:extrinsic_idx],
    #     module_id: event[:module_metadata][:name],
    #     event_id: event[:event_index],
    #     params: event[:params].to_json
    #   })
    # end

    # register = Scale::TypeRegistry.instance

    # Block.create(
    #   number: block_number,
    #   timestamp: get_timestamp(block),
    #   block_hash: block_hash,
    #   parent_hash: block["block"]["header"]["parentHash"],
    #   state_root: block["block"]["header"]["stateRoot"],
    #   extrinsics_root: block["block"]["header"]["extrinsicsRoot"],
    #   # extrinsics: block["block"]["extrinsics"].join(","),
    #   extrinsic_count: block["block"]["extrinsics"].length,
    #   raw_events: raw_events,
    #   events: event_objs,
    #   event_count: events.length,
    #   # logs: block["block"]["header"]["digest"]["logs"].join(","),
    #   spec_version: register.spec_version.to_i,
    #   validator: "",
    #   codec_error: true,
    #   finalized: true
    # )
  end
end
