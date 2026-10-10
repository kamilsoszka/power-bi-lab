let
    Source =
        Table.FromRows(
            Json.Document(
                Binary.Decompress(
                    Binary.FromText(
                        "i45W8k1NLC4tSi1Wio0FAA==",
                        BinaryEncoding.Base64
                    ),
                    Compression.Deflate
                )
            ),
            let
                _t =
                    ((type nullable text)
                        meta
                        [
                            Serialized.Text = true
                        ])
            in
                type table
                [
                    Placeholder = _t
                ]
        )
in
    Source
