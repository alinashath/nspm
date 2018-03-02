Class StringNumberComparer
    Implements IComparer(Of String)

    Public Function Compare(x As String, y As String) As Integer Implements IComparer(Of String).Compare
        Dim compareResult As Integer
        Dim xIndex As Integer = 0, yIndex As Integer = 0
        Dim xIndexLast As Integer = 0, yIndexLast As Integer = 0
        Dim xNumber As Integer, yNumber As Integer
        Dim xLength As Integer = x.Length
        Dim yLength As Integer = y.Length

        Do
            Dim xHasNextNumber As Boolean = TryGetNextNumber(x, xIndex, xNumber)
            Dim yHasNextNumber As Boolean = TryGetNextNumber(y, yIndex, yNumber)

            If Not (xHasNextNumber AndAlso yHasNextNumber) Then
                ' At least one the strings has either no more number or contains non-numeric chars
                ' In this case do a string comparison of that last part
                Return x.Substring(xIndexLast).CompareTo(y.Substring(yIndexLast))
            End If

            xIndexLast = xIndex
            yIndexLast = yIndex

            compareResult = xNumber.CompareTo(yNumber)
        Loop While compareResult = 0 AndAlso xIndex < xLength AndAlso yIndex < yLength

        Return compareResult
    End Function

    Private Function TryGetNextNumber(text As String, ByRef startIndex As Integer, ByRef number As Integer) As Boolean
        number = 0

        Dim pos As Integer = text.IndexOf("."c, startIndex)
        If pos < 0 Then
            pos = text.Length
        End If

        If Not Integer.TryParse(text.Substring(startIndex, pos - startIndex), number) Then
            Return False
        End If

        startIndex = pos + 1

        Return True
    End Function
End Class