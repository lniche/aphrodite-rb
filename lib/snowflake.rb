class Snowflake
  EPOCH = 1_577_836_800_000

  attr_reader :data_center_id, :worker_id, :sequence, :last_timestamp

  def initialize(data_center_id, worker_id)
    @data_center_id = data_center_id & 0x1F     
    @worker_id = worker_id & 0x1F            
    @sequence = 0                             
    @last_timestamp = -1                   
  end

  def generate_id
    timestamp = current_time_millis

    raise 'The system clock is set back and ID generation fails.' if timestamp < @last_timestamp

    if timestamp == @last_timestamp
      @sequence = (@sequence + 1) & 0xFFF
      if @sequence == 0
        timestamp = til_next_millis(@last_timestamp)
      end
    else
      @sequence = 0
    end

    @last_timestamp = timestamp

    ((timestamp - EPOCH) << 22) |
      (data_center_id << 17) |
      (worker_id << 12) |
      sequence
  end

  private

  def current_time_millis
    (Time.now.to_f * 1000).to_i
  end

  def til_next_millis(last_timestamp)
    timestamp = current_time_millis
    timestamp = current_time_millis while timestamp <= last_timestamp
    timestamp
  end
end
