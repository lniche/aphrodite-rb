class Snowflake
  # 定义纪元时间戳 (毫秒) - 自定义起点时间，例如2020-01-01 00:00:00 UTC
  EPOCH = 1_577_836_800_000

  attr_reader :data_center_id, :worker_id, :sequence, :last_timestamp

  def initialize(data_center_id, worker_id)
    @data_center_id = data_center_id & 0x1F      # 数据中心ID限制为5位
    @worker_id = worker_id & 0x1F                # 工作节点ID限制为5位
    @sequence = 0                                # 序列号初始为0
    @last_timestamp = -1                         # 记录上一次生成ID的时间戳
  end

  def generate_id
    timestamp = current_time_millis

    raise '系统时钟回拨，生成ID失败。' if timestamp < @last_timestamp

    if timestamp == @last_timestamp
      # 同一毫秒内增加序列号
      @sequence = (@sequence + 1) & 0xFFF
      if @sequence == 0
        # 当前毫秒内序列号已用尽，等待下一毫秒
        timestamp = til_next_millis(@last_timestamp)
      end
    else
      @sequence = 0
    end

    @last_timestamp = timestamp

    # 生成唯一 ID，64 位 (时间戳 | 数据中心ID | 工作节点ID | 序列号)
    ((timestamp - EPOCH) << 22) |
      (data_center_id << 17) |
      (worker_id << 12) |
      sequence
  end

  private

  # 获取当前时间的毫秒数
  def current_time_millis
    (Time.now.to_f * 1000).to_i
  end

  # 等待到下一毫秒
  def til_next_millis(last_timestamp)
    timestamp = current_time_millis
    timestamp = current_time_millis while timestamp <= last_timestamp
    timestamp
  end
end
