using System;

namespace Semmle.Extraction.CSharp
{
    /// <summary>
    /// The mode in which a file is extracted.
    /// </summary>
    [Flags]
    public enum ExtractorMode
    {
        None = 0,
        Standalone = 1,
        Pdb = 2,
        QlTest = 4,
        BinaryLog = 8,
    }
}
