﻿using Starward.Core.Gacha;
using System.Text.Json.Serialization;

namespace Starward.Core.Hyperion.StarRail.Ledger;

/// <summary>
/// 开拓月历明细单项
/// </summary>
public class LedgerDetailItem
{

    [JsonIgnore]
    public int Id { get; set; }

    public int Uid { get; set; }

    /// <summary>
    /// 202304
    /// </summary>
    public string Month { get; set; }

    /// <summary>
    /// 1 星琼  2 星轨票
    /// </summary>
    public int Type { get; set; }

    [JsonPropertyName("action")]
    public string Action { get; set; }

    [JsonPropertyName("action_name")]
    public string ActionName { get; set; }

    [JsonPropertyName("time")]
    [JsonConverter(typeof(DateTimeJsonConverter))]
    public DateTime Time { get; set; }

    [JsonPropertyName("num")]
    public int Number { get; set; }
}

