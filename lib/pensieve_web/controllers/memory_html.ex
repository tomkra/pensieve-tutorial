defmodule PensieveWeb.MemoryHTML do
  use PensieveWeb, :html

  alias Pensieve.Memories.Memory

  embed_templates "memory_html/*"

  attr :memories, :list, required: true
  def information(assigns) do
    ~H"""
    <div class="italic mb-4">
      There are <%= length(@memories) %> memories in your Pensieve
    </div>
    """
  end

  def memory_inserted_at(%Memory{inserted_at: timestamp}) do
    Calendar.strftime(timestamp, "%m/%d/%Y %I:%M%p")
  end
end
